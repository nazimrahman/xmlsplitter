# xmlsplitter
This script breaks a large xml file into many smaller xml files. The data is broken down by number of records. You can only run this script from command line.
## Installation
Just git clone the script. chmod 755 and you are good to go.
## Syntax and Parameters
perl xmlsplitter.pl originalfile recordroot numberofrecords stemOfFilename newroot

1. First parameter defines the location of the file you wish to split
2. root of the record. In the example below, person is the record root.
3. number of records you want to store in each new file
4. stem of the name of the new files
5. root of the xml documents

### example:
perl xmlsplitter.pl bigfile.xml person 5000 smallfile employees

### output:
smallfile-0.xml
smallfile-1.xml
...

### sample xml
`<employees>
  <person>
    <name>Adam</name>
  </person>
  <person>
    <name>Smith</name>
  </person>
<employees>`

