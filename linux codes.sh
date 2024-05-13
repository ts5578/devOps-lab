#Write a Bash script that prompts the user to enter a command and executes it. Additionally, capture the command output and display it with a timestamp.
function display_timestamp(){
	date + "[%Y-%m-%d %H:%M:%S]"
}

while true; do
	read -p "enter command: " user_command
	
	if [["$user_command" == "exit" ]]; then
		echo "exiting the script.."
		break
	fi
	
	command_output=$(eval "$user_command" 2>&1)
	
	echo "$(display_timestamp) output of the command '$user_command':"
	echo "$command_output"
	
done

#Create a script that redirects the output of a command to a file. Allow the user to specify the filename as an argument. Ensure the script checks for existing files and prompts the user for confirmation before overwriting.
#!/bin/bash

# Function to prompt for confirmation
prompt_confirmation() {
    while true; do
        read -p "File '$1' already exists. Do you want to overwrite it? (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Main script
if [ $# -lt 2 ]; then
    echo "Usage: $0 <command> <filename>"
    exit 1
fi

command_to_execute=$1
filename=$2

# Check if the file already exists
if [ -e "$filename" ]; then
    prompt_confirmation "$filename"
    if [ $? -ne 0 ]; then
        echo "Operation canceled."
        exit 1
    fi
fi

# Execute the command and redirect output to the specified file
$command_to_execute > "$filename"
echo "Output of command '$command_to_execute' has been redirected to '$filename'."


#Build a script that echoes a custom welcome message to the user based on the time of day. Use the date command to determine whether it's morning, afternoon, or evening.
h=$(date +"%H")
if [ $h -gt 6 -a $h -le 12 ]
then
echo good morning
elif [ $h -gt 12 -a $h -le 16 ]
then 
echo good afternoon
elif [ $h -gt 16 -a $h -le 20 ]
then
echo good evening
else
echo good night
fi


#Develop a script that prompts the user for their name and age. Store these values in variables and use them to generate a personalized greeting along with their birth year.
read -p "Enter your name: " user_name
read -p "Enter your age: " user_age

current_year=$(date +%Y)
birth_year=$((current_year - user_age))

echo "Hello, $user_name! You are $user_age years old, and your birth year is $birth_year."

#Create a script that searches for a specific pattern within a given text file. Allow the user to input the pattern and the file name. Display the matching lines along with line numbers.
function search_pattern_in_file(){
	local pattern="$1"
	local pattern="$2"
	
	if [! -f "$filename"]; then
		echo "File '$filename' not found."
		exit 1
	fi
	
	grep -n "$pattern" "$filename"
}

read -p "enter the pattern to search: " pattern
read -p "enter the filename to search in: " filename

search_pattern_in_file "$pattern" "$filename"

#Write a script that processes a CSV file and extracts specific columns based on user input. Allow the user to specify the input file and the column numbers to be extracted.
#!/bin/bash

# Function to extract specific columns from CSV file
extract_columns_from_csv() {
    local filename="$1"
    local columns="$2"

    # Check if file exists
    if [ ! -f "$filename" ]; then
        echo "File '$filename' not found."
        exit 1
    fi

    # Extract specific columns from CSV file using cut command
    cut -d ',' -f "$columns" "$filename"
}

# Main script
read -p "Enter the filename (CSV): " filename
read -p "Enter the column numbers to extract (comma-separated): " columns

# Call the function to extract specific columns from CSV file
extract_columns_from_csv "$filename" "$columns"


#Build a script that checks if a user-supplied number is even or odd. Use logical operators to validate the input and provide appropriate feedback.
echo "---- EVEN OR ODD IN SHELL SCRIPT -----";
echo -n "Enter a number:";
read n;
echo -n "RESULT: ";
if [ `expr $n % 2` == 0 ]
then
	echo "$n is even";
else
	echo "$n is Odd";
fi

#Develop a script that schedules a task to run at a specific time using the at command. Prompt the user for the command and the time at which it should be executed.
#!/bin/bash

# Prompt the user for the command to execute
read -p "Enter the command to execute: " command

# Prompt the user for the time at which the command should be executed
read -p "Enter the time to execute the command (HH:MM format): " execute_time

# Validate the time format (HH:MM)
if ! [[ $execute_time =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
    echo "Invalid time format. Please use HH:MM format."
    exit 1
fi

# Schedule the task using the 'at' command
echo "$command" | at $execute_time 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Task scheduled successfully to run at $execute_time."
else
    echo "Failed to schedule task."
fi


#Create a script that performs basic arithmetic operations (addition, subtraction, multiplication, division) on two user-supplied numbers. Display the results with appropriate formatting.
# Main script
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Function to perform addition
addition() {
  result=$(echo "$1 + $2" | bc)
  echo "Sum: $result"
}
# Function to perform subtraction
subtraction() {
  result=$(echo "$1 - $2" | bc)
  echo "Difference: $result"
}
# Function to perform multiplication
multiplication() {
 result=$(echo "$1 * $2" | bc)
 echo "Product: $result"
}

# Function to perform division
division() {
 if [ "$2" -eq 0 ]; then
 echo "Error: Division by zero is not allowed."
 else
 result=$(echo "scale=2; $1 / $2" | bc)
 echo "Quotient: $result"
 fi
}
# Function Call to perform arithmetic operations.

addition "$num1" "$num2"
subtraction "$num1" "$num2"
multiplication "$num1" "$num2"
division "$num1" "$num2"

#Write a script that prompts the user for their age and provides different messages based on whether they are a child, teenager, adult, or senior citizen.
#!/bin/bash
read -p "Enter your age: " user_age
# Check the age range and display an appropriate message
if [ $user_age -lt 0 ]; then
    echo "Invalid age. Please enter a positive number."
elif [ $user_age -lt 13 ]; then
    echo "You are a child."
elif [ $user_age -lt 20 ]; then
    echo "You are a teenager."
elif [ $user_age -lt 65 ]; then
    echo "You are an adult."
else
    echo "You are a senior citizen."
fi













