# mimic_program_df.jl
# process file and tabulate admission location breakdown (using DataFrames)

# load packages
using CSV
using DataFrames

function analyze_df(input_file, output_file)

	# load file into DataFrame
	m_df = CSV.File(input_file, header=1, footerskip=0, delim=",") |> DataFrame

	# print and describe DF
	#println(m_df)
	# println(describe(m_df))
	
	# get admission location counts	
	a_loc_count_df = combine(groupby(m_df, :admission_location), nrow => :N)
	sort!(a_loc_count_df, (:N), rev=(true))

	# print and save counts
	println(a_loc_count_df)
	CSV.write(output_file, a_loc_count_df)

end

analyze_df("admissions.csv", "admissions_count_df.txt")
