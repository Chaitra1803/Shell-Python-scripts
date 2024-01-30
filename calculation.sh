#!/bin/bash

# Prompt user for input
echo "Enter the first number:"
read num1

echo "Enter the second number:"
read num2

# Perform calculations
sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))

# Check if the second number is not zero before performing division
if [ $num2 -ne 0 ]; then
  division=$(echo "scale=2; $num1 / $num2" | bc)
else
  division="Undefined (division by zero)"
fi

# Display the results
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Division: $division"

