#!/usr/bin/perl

# This code splits a large xml file into smaller xml files

# get parameters from commandline
my ($originalFile, $tag, $numRecords, $newFileStem, $root) = @ARGV;
print "$originalFile $tag $numRecords $newFileStem $root\n";

# open original file
open(INPUT, $originalFile) or die "Cannot open $originalFile";

$idx = 0;  # index to the current row 
$i = 0;    # counts rows to place in a file

# open new file, write opening tag
open(OUTPUT,">$newFileStem-$idx.xml") or die "Cannot open new file for writing";
print OUTPUT "<$root>\n";

# remove all content before the first record
while(<INPUT>) {
  if (/^<entry/) {
    print OUTPUT $_;
    last;   # break out of loop
  }
}

# loop through original file
while(<INPUT>) {
  # print line to new file
  print OUTPUT $_;
    
  # if an entry is completed
  if(/^<\/$tag>/) { 
    $i++;  
        
    # if there are $numRecords or more row, close file and start new file
    if ($i > $numRecords) {
      $i = 0;                    # reset counter
      print OUTPUT "</$root>\n"; # print closing tag
      close(OUTPUT);             # close new file
      $idx++;                    # increment new file count
            
      # open new file, write opening tag
      open(OUTPUT,">$newFileStem-$idx.xml") or die;
      print "Creating $newFileStem-$idx.xml ...\n";
      print OUTPUT "<$root>\n";
    }
  }
}
# print closing tag, close all files
#print OUTPUT "</$root>\n";
close(OUTPUT);
close(INPUT);
