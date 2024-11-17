#!/bin/bash


cp and2.v $1.v
cp and2_tb.v $1_tb.v

sed -i '' -e "s/and2/$1/g" $1_tb.v
sed -i '' -e "s/and2/$1/g" $1.v
sed -i '' -e "s/c=a&b/c=$2/g" $1.v

iverilog -o $1.out $1.v $1_tb.v
vvp $1.out
#gtkwave $1_test.vcd &