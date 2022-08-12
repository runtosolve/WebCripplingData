using DataFrames, CSV, DataStructures

Data_1 = CSV.File(open(read, "src/Beshara_2000/Beshara_2000.csv")) |> DataFrame

json_1 = [OrderedDict(d[1] => d[2] for d in zip(names(Data_1), Data_1[item, :]))  for item in 1:size(Data_1)[1]]

Data_2 = CSV.File(open(read, "src/Young_2001/Young 2001.csv")) |> DataFrame

json_2 = [OrderedDict(d[1] => d[2] for d in zip(names(Data_2), Data_2[item, :]))  for item in 1:size(Data_2)[1]]

combined_json = merge!(json_1, json_2)

