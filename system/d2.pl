#!/usr/bin/perl
# replace spaces in all filenames with underscores

use File::Find;
sub process_file {
    opendir(DIR, $dir) || die "Can't open $dir\n";
for (readdir(DIR)) {
  next if $_ eq '.';
  next if $_ eq '..';
  next if $_ eq 'lost+found';
  $newfile = $_;
  $newfile =~ s/ /_/g;
  rename $_, $newfile;
}
}
find(\&process_file, @DIRLIST);