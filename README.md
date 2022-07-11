# WebCripplingData

This respository contains web crippling test data for cold-formed steel members.

The main data file is [web_crippling_data.json](data/web_crippling_data.json).

## Data structure

* specimen_number
* web_link
* author_name_1
* author_name_2
* specimen_name
* cross_section_type
* t
* D1
* D2
* r
* B1
* B2
* d1
* d2
* L
* n
* fy 
* Pt

## Add your data

Open an [issue](https://github.com/runtosolve/WebCripplingData/issues) and we will work with you to add your data.

## Data usage

Import the data into a DataFrame so that you can use it.

### **Julia**

```julia
# turn a json string source into a DataFrame

filename = the path of json file you download from Github
using DataFrames, JSON3, JSONTables
json_string = read(filename, String)
json_source = JSON3.read(json_string)
df = DataFrame(jsontable(json_source))

# json source can be array of objects, or object of arrays
# write out a DataFrame as an array of objects
arraytable(df)

# write out a DataFrame as an object of arrays
objecttable(df)
```

### **Python**

```python
import pandas as pd
# First parameter can be in three formats: A JSON String, A path to the JSON file, The JSON file's name

# Second parameter (orient): Specify the orientation of the JSON string

df = pd.read_json('string/path/file_name', orient) 
print(df)
```

### **Matlab**

``` matlab
filename = the path of json file you download from Github;
fid = fopen(filename);
raw = fread(fid,inf);
string = char(raw');
fclose(fid);
df = jsondecode(string);
```
