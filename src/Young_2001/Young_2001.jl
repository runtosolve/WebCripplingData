using CSV
using DataFrames
using JSON
using Base64
using StringEncodings
using DataStructures
using JSONTables

# Data = CSV.read(pkgdir(WebCripplingData, "src", "Young_2001.csv"), DataFrame)
Data = CSV.File(open(read, "src/Young_2001/Young 2001.csv")) |> DataFrame
# Data = CSV.File(open(read, "./Data.csv", enc"GB18030")) |> DataFrame

units = Array{Array{Any, 1}, 1}(undef, 0)
for i = 1:nrow(Data)

    units = vcat(units, [[[], [], [], [], "mm", "mm", "MPa", "MPa", "MPa", "MPa", "mm", [], [], "kN", "mm"]])

end

insertcols!(Data, 5, :units => units)

all_data_json = [OrderedDict(d[1] => d[2] for d in zip(names(Data), Data[item, :]))  for item in 1:size(Data)[1]]
stringdata = JSON.json(all_data_json, 4)
open("write_read.json", "w") do f
    write(f, stringdata)
 end