filename = "/Users/zhoushangqun/Documents/dev/WebCripplingData/data/Combined_Data.json"
using DataFrames, JSON3, JSONTables
json_string = read(filename, String)
json_source = JSON3.read(json_string)
df = DataFrame(jsontable(json_source))