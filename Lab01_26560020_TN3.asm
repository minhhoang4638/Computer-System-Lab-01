
# Name: Nguyen Minh Hoang
# Student ID: 26560020
# Purpose: Lab 01, TN3 - printing messages, calculating energy
# usage between two readings, and summarizing usage over three months.

.data
# Listing 5 - print a message and an integer
msg:      .asciiz "Usage (kWh): "
nl:       .asciiz "\n"

# Listing 6 - energy used between two readings
prompt1:  .asciiz "Enter previous reading (kWh): "
prompt2:  .asciiz "Enter current reading (kWh): "
label:    .asciiz "Usage (kWh): "
newline:  .asciiz "\n"

# Listing 7 - data section
prompt:   .asciiz "Enter reading (kWh): "
m1:       .asciiz "Month 1: "
m2:       .asciiz "Month 2: "
m3:       .asciiz "Month 3: "
tot:      .asciiz "Total: "

.text
.globl main
main:
    # Part A: Listing 5 - print a message and an integer
    addi $t0, $zero, 150     # Store usage value 150 in $t0

    li   $v0, 4              # service 4: print string
    la   $a0, msg            # argument: address of msg
    syscall                  # print "Usage (kWh): "

    li   $v0, 1              # service 1: print integer
    add  $a0, $t0, $zero     # argument: copy value from $t0 to $a0
    syscall                  # print integer 150

    li   $v0, 4              # service 4: print string
    la   $a0, nl             # argument: address of newline string
    syscall                  # print a new line

    # Part B: Listing 6 - energy used between two readings

    # Register plan:
    # $s0 = previous reading
    # $s1 = current reading
    # $t0 = usage (current - previous)

    # Read the previous reading into $s0
    li   $v0, 4
    la   $a0, prompt1
    syscall                  # Print previous reading prompt

    li   $v0, 5
    syscall                  # Read previous reading
    add  $s0, $v0, $zero     # Store previous reading in $s0

    # Read the current reading into $s1
    li   $v0, 4
    la   $a0, prompt2
    syscall                  # Print current reading prompt

    li   $v0, 5
    syscall                  # Read current reading
    add  $s1, $v0, $zero     # Store current reading in $s1

    # Calculate usage = current - previous
    sub  $t0, $s1, $s0       # Store usage in $t0

    # Print label and usage
    li   $v0, 4
    la   $a0, label
    syscall                  # Print usage label

    li   $v0, 1
    add  $a0, $t0, $zero     # Copy usage to $a0
    syscall                  # Print usage integer

    # Print a newline
    li   $v0, 4
    la   $a0, newline
    syscall                  # Print newline

    # Part C: Listing 7 - three-month summary

    # Read the first reading into $s0
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    # Read the second reading into $s1
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    # Read the third reading into $s2
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    # Read the fourth reading into $s3
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    # Calculate usage for each month
    sub  $t0, $s1, $s0
    sub  $t1, $s2, $s1
    sub  $t2, $s3, $s2

    # Calculate total usage
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2

    # Print Month 1
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Print Month 2
    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Print Month 3
    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Print Total
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Exit program
    li   $v0, 10
    syscall
