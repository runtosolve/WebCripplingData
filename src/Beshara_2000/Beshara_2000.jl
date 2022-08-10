using WebCripplingData
using CSV
using DataFrames
using JSON
using Base64
using StringEncodings
using DataStructures
using JSONTables

Data = CSV.read(pkgdir(WebCripplingData, "assets", "web_crippling_data.csv"), DataFrame)

# Data = CSV.File(open(read, "./Data.csv", enc"GB18030")) |> DataFrame
all_data_json = [OrderedDict(d[1] => d[2] for d in zip(names(Data), Data[item, :]))  for item in 1:size(Data)[1]]
stringdata = JSON.json(all_data_json, 4)
open("write_read.json", "w") do f
    write(f, stringdata)
 end
 
<<<<<<< HEAD
using DataStructures
 all_data_json = [OrderedDict(d[1] => d[2] for d in zip(names(Data), Data[1, :]))]
 
 
 stringdata = JSON.json(all_data_json, 4)
 open("write_read_one_row.json", "w") do f
     write(f, stringdata)
  end




 cdm = zip(names(Data), Data[1, :])


 Keys = [key for (key, val) in all_data_json]
Values = [val for (key, val) in all_data_json]
=======
>>>>>>> WCD
