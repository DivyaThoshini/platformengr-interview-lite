#!/bin/bash

# Function to calculate hypotenuse
calculate_hypotenuse() {
a=$1
b=$2
# Using bc for floating point math
echo "scale=20; sqrt(($a * $a) + ($b * $b))" | bc -l
}

# Check if two arguments are passed
if [ $# -ne 2 ]; then
echo "Usage: $0 <side_a> <side_b>"
exit 1
fi

# Call function with inputs
result=$(calculate_hypotenuse $1 $2)
echo $result
