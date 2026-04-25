;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425j
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (1): nftables-geoip-db
;;; Already resolved (0): --
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-compression)
  #:use-module (gnu packages networking)
  #:export (nftables-geoip-db))


;;; ---- 1. nftables-geoip-db ----
;;; AUR: nftables-geoip-db (#18264)
;;; GeoIP Database for nftables
;;; License: BSD, GPL (data: CC-BY 4.0)

(define-public nftables-geoip-db
  (package
    (name "nftables-geoip-db")
    (version "2026.04")
    (source (origin
              (method url-fetch)
              (uri (let ((v (string-map (lambda (c)
                                          (if (char=? c #\.) #\- c))
                                        version)))
                     (string-append
                      "https://download.db-ip.com/free/dbip-country-lite-"
                      v ".csv.gz")))
              (sha256
               (base32
                "1kzcgpc1rl49rphm9g76cc238rs09ch08hwkch4kxg63fmxd9xld"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'bootstrap)
          (delete 'configure)
          (delete 'build)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "dbip-country-lite.csv.gz")))
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (use-modules (ice-9 popen)
                           (ice-9 rdelim))
              (let* ((out (assoc-ref outputs "out"))
                     (share (string-append out "/share/nftables-geoip"))
                     (perl (search-input-file inputs "bin/perl")))
                (mkdir-p share)
                (invoke perl "-e" "
use strict;
use warnings;
use IO::Uncompress::Gunzip qw(gunzip $GunzipError);
use Text::CSV_XS;

my $csv = Text::CSV_XS->new({binary => 1, auto_diag => 1});
my $z = IO::Uncompress::Gunzip->new('dbip-country-lite.csv.gz')
  or die \"gunzip failed: $GunzipError\\n\";

my (%v4, %v6);
while (my $row = $csv->getline($z)) {
  my ($s, $e, $cc) = @$row;
  $cc = lc($cc);
  if ($s =~ /:/) {
    push @{$v6{$cc}}, \"$s-$e\";
  } else {
    push @{$v4{$cc}}, \"$s-$e\";
  }
}
close $z;

my $outdir = $ARGV[0];

open my $f4, '>', \"$outdir/geoip-def-nft4.conf\" or die $!;
for my $cc (sort keys %v4) {
  print $f4 \"define geoip4_$cc = {\\n\";
  print $f4 join(\",\\n\", map {\"  $_\"} @{$v4{$cc}});
  print $f4 \"\\n}\\n\\n\";
}
close $f4;

open my $f6, '>', \"$outdir/geoip-def-nft6.conf\" or die $!;
for my $cc (sort keys %v6) {
  print $f6 \"define geoip6_$cc = {\\n\";
  print $f6 join(\",\\n\", map {\"  $_\"} @{$v6{$cc}});
  print $f6 \"\\n}\\n\\n\";
}
close $f6;

print \"Generated nftables geoip definitions for \",
  scalar(keys %v4), \" IPv4 and \",
  scalar(keys %v6), \" IPv6 country sets.\\n\";
" share)))))))
    (native-inputs
     (list perl
           perl-text-csv-xs
           perl-io-compress))
    (home-page "https://db-ip.com/db/download/ip-to-country-lite")
    (synopsis "GeoIP database for nftables firewall rules")
    (description "This package provides country-level GeoIP data from DB-IP Lite
in nftables-compatible set definition format.  The data can be included in
nftables rulesets to filter traffic by geographic origin using @code{define}
directives.  Uses the DB-IP Lite database (April 2026 snapshot).")
    (license (list license:cc-by4.0 license:gpl3+))))
