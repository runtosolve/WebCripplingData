using DataFrames, CSV, DataStructures, JSON

Data_1 = CSV.File(open(read, "src/Beshara_Schuster_2000/Beshara_Schuster_2000.csv")) |> DataFrame

Data_2 = CSV.File(open(read, "src/Young_Hancock_2001/Young_Hancock_2001.csv")) |> DataFrame

combined_Data = [Data_1; Data_2]

units = Array{Array{Any, 1}, 1}(undef, 0)
for i = 1:nrow(combined_Data)

    units = vcat(units, [[[], [], [], [], [], [], [], "mm", "mm", "mm", "mm", "mm", "mm", "mm", "MPa", "KN"]])

end

insertcols!(combined_Data, 17, :units => units)

all_data_json = [OrderedDict(d[1] => d[2] for d in zip(names(combined_Data), combined_Data[item, :]))  for item in 1:size(combined_Data)[1]]
stringdata = JSON.json(all_data_json, 4)
open("data/Combined_Data.json", "w") do f
    write(f, stringdata)
end