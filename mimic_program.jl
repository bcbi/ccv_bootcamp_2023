# mimic_program.jl
# process file and tabulate admission location breakdown

function main()
    # input files
    admissions_file_name = "admissions.csv"

    # output file
    count_file_name = "./admissions_count.txt"

    # create input and ouput file handles
    input_admissions_file = open(admissions_file_name, "r")
    output_count_file = open(count_file_name, "w")

    # create dictionary to store admission location counts
    count_dict = Dict()

    # read admissions file line by line
    line_count = 0

    for line in eachline(input_admissions_file)

        # println(line)

        # skip first line (header)
        line_count += 1
        if line_count == 1
            continue
        end

        # split line into array
        line_part_array = split(line, ",")

        # get admission location from line
        a_loc = line_part_array[8]

        # tabulate admission locations
        if !haskey(count_dict, a_loc)
            count_dict[a_loc] = 1
        else
            count_dict[a_loc] += 1
        end
    end   

    # print out counts to STDOUT and output file
    for a_loc in keys(count_dict)
        println("$(a_loc)|$(count_dict[a_loc])")
        print(output_count_file, "$(count_dict[a_loc])|$(a_loc)\n")

    end

    # close output file
    close(output_count_file)
end

# run main function
main()

#=
    # *** TO DO IN CLASS IF TIME ***
    # println("$(lowercase(a_loc))|$(count_dict[a_loc])")

    # print out counts (sorted in descending order)
    for (count, a_loc) in sort(collect(zip(values(count_dict),keys(count_dict))), rev=true)
        println("$(a_loc)|$(count_dict[a_loc])")
        print(output_count_file, "$(a_loc)|$(count_dict[a_loc])\n")
    end
=#
