# mimic_program.py
# process file and tabulate admission location breakdown

# load fileinput module
import fileinput

def main():

    # print("hello, world!")

    # input files
    admissions_file = "admissions.csv"

    # output file
    count_file_name = "./admissions_count2.txt"
    output_count_file = open(count_file_name, "w")

    # create dictionary to store admission location counts
    count_dict = {}

     # read admissions file line by line
    line_count = 0
    for line in fileinput.input(admissions_file):

        #print(line)

        # skip first line (header)
        line_count += 1
        if line_count == 1:
            continue

        # split line into array
        line_part_array = line.split(",")

        # get admission location from line
        a_loc = line_part_array[7]

        # tabulate admission locations
        if not(a_loc in count_dict):
            count_dict[a_loc] = 1
        else:
            count_dict[a_loc] += 1
 
    # print out counts to STDOUT and output file
    for a_loc in count_dict.keys():
        print(a_loc + "|" + str(count_dict[a_loc]))
        print(a_loc + "|" + str(count_dict[a_loc]), file = output_count_file)

# run main function
main()