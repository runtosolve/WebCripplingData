using CSV
using DataFrames
using JSON
using Base64
using StringEncodings
using DataStructures
using JSONTables

Data = CSV.File(open(read, "src/Beshara_2000/Beshara_2000.csv")) |> DataFrame

# units = Array{Array{Any, 1}, 1}(undef, 0)
units = []
for i = 1:nrow(Data)

    units = vcat(units, [[[], [], [], [], [], [], [], "mm", "mm", "mm", "mm", "mm", "mm", "mm", "MPa", "MPa"]])

end

insertcols!(Data, 5, :units => units)

all_data_json = [OrderedDict(d[1] => d[2] for d in zip(names(Data), Data[item, :]))  for item in 1:size(Data)[1]]
stringdata = JSON.json(all_data_json, 4)
open("write_read.json", "w") do f
    write(f, stringdata)
 end
 

