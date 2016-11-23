# Example 1A Panagiotis-Stephanos Makos icsd15111

.data                        # directive of assemply, from here the variables declared

str: .asciiz "Panagiotis-Stephanos Makos\n"    #variable "str" name, string type ascii characters in the " ", the price we pay, the ".asciiz" tells us the type of the variable
str1: .asciiz "321/2015111, icsd15223"  #similarly to the variable str1




.text   # the program is placed below the directive .text

main:    #from here starts the main program

la $a0,str # to print a string must first save the address of the registrar $a0, namely here the command "la" stores the address of the variable "στρ" in register $a0
               

li $v0,4 # is price system call for printing a string, then 4 is the system call code, stores the value of the variable str, in register $v0, this essentially makes the command li
           
            
syscall  # prints the string, the value of the variable "str", this command executes a system call
     

la $a0,str1 # again if you print must store the address of str1 in register "$ao", like the command "la"
              
li $v0,4  #again becomes a system call to print string, like 4, the command "li" loads the value of the variable str1, in register $v0
syscall   # prints the string, price of str1,command of MIPS, performs system call


li $v0,10  #Here's call system with code 10 corresponds to the output of the system 
syscall   # ends execution with the command syscall
