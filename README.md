# Homework-11

32-bit x86 Assembly (NASM) * Linux

# Purpose

# How to execute
This program will loop through what's in the input buffer, and call byte_to_ascii for each byte
Then byte to ascii will convert the high and low nibbles using the lookup table
The results will go to the output buffer
finally, the sytem will output the output buffer and call for the exit of the program.

# How to run

Once installed go to terminal and type in
nasm -f elf32 translate2Ascii.asm -o translate2Ascii.o
ld -m elf_i386 translate2Ascii.o -o hw11translate2Ascii


Finally run
./hw11translate2Ascii





If you don't have nasm installed then you are going to have to install it for your system

