
# Name: Nguyen Minh Hoang
# Student ID: 26560020
# Purpose: Lab 01, Experiment 2 - energy used over three months and translating statements.
#
# Register plan:
#
# Part A - Listing 3:
# $s0 = reading0 (start of month 1)
# $s1 = reading1 (start of month 2)
# $s2 = reading2 (start of month 3)
# $s3 = reading3 (end of month 3)
# $t0 = usage1 (energy used in month 1)
# $t1 = usage2 (energy used in month 2)
# $t2 = usage3 (energy used in month 3)
# $t3 = total usage
#
# Part B - Listing 4:
# $s0 = y = 8
# $s1 = z = 5
# $s2 = w = 3
# $t0 = x1
# $t1 = x2
# $t2 = x3
# $t3 = x4
# $t5 = temporary register

.text
.globl main

main:

    # ==========================================
    # Part A - Listing 3
    # Energy used by a household
    # ==========================================

    # Initialize meter readings
    addi $s0, $zero, 1200
    addi $s1, $zero, 1350
    addi $s2, $zero, 1475
    addi $s3, $zero, 1640

    # usage1 = reading1 - reading0
    sub $t0, $s1, $s0

    # usage2 = reading2 - reading1
    sub $t1, $s2, $s1

    # usage3 = reading3 - reading2
    sub $t2, $s3, $s2

    # total = usage1 + usage2 + usage3
    add $t3, $t0, $t1
    add $t3, $t3, $t2


    # ==========================================
    # Part B - Listing 4
    # Translating statements
    # ==========================================

    # Initialize variables
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3

    # x1 = y + z + w
    add $t0, $s0, $s1
    add $t0, $t0, $s2

    # x2 = (y + z) - (w + 5)
    add $t5, $s0, $s1
    addi $t1, $s2, 5
    sub $t1, $t5, $t1

    # x3 = y (copy)
    add $t2, $s0, $zero

    # x4 = z - y
    sub $t3, $s1, $s0

    # Exit program
    li $v0, 10
    syscall
