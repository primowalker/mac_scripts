#!/usr/bin/perl -w   
# (1) quit unless we have the correct number of command-line args 
$num_args = $#ARGV; 
if ($num_args != 1) {     
	print "\nUsage: bytesconv.pl name value unit <B, KB, MB, GB>\n";     
	exit; }   
	
	$value=$ARGV[0]; 
	$unit=$ARGV[1];   
	
		if  ($unit eq B) {
			$kb = $value / 1024;
			$mb = $value / 1024 / 1024;
			$gb = $value / 1024 / 1024 / 1024;
			print "\nKB=$kb\nMB=$mb\nGB=$gb\n"; 
		} elsif ($unit eq KB) {
			$bytes = $value * 1024;
			$mb = $value / 1024;
			$gb = $value / 1024 / 1024; 
			print "\nBytes=$bytes\nMB=$mb\nGB=$gb\n"; 
		} elsif ($unit eq MB) {
			$bytes = $value * 1024 * 1024;
			$kb = $value * 1024;
			$gb = $value / 1024; 
			print "\nBytes=$bytes\nKB=$kb\nGB=$gb\n"; 
		} elsif ($unit eq GB) {
			$bytes = $value * 1024 * 1024 * 1024;
			$kb = $value * 1024 * 1024;
			$mb = $value * 1024; 
			print "\nBytes=$bytes\nKB=$kb\nMB=$mb\n"; 
			}
	