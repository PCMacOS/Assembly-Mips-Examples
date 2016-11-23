# Panagiotis-Stephanos Makos icsd15111
.data # diloseis metavliton

message1: .asciiz "Calculation of the Greatest Common Divisor of two integers using Euclid's algorithm"
message2: .asciiz "\nEisigage ton proto akeraio\n"
message3: .asciiz "Eisigage ton deutero akeraio\n"
message4: .asciiz "Mhdenikes times"
message5: .asciiz "The Greatest Common Divisor is: "


.text
main:             # edo arxizei to kurios programma    

la $a0,message1  # emfanish protou mhnmatos tupou string
li $v0,4  
syscall


Label0:   # etiketa


la $a0,message2  # emfanish deuterou mhnymatos tupou string
li $v0,4
syscall
 
li $v0,5    # diavasma apo to plhktrologio enos akeraiou  kai apothikeush ston kataxoriti $v0
syscall
move $t0,$v0     #  antigrafei to periexomeno tou kataxoriti $v0 ston kataxoriti $t0


la $a0,message3  # emfanish tritou mhnymatos tupou string
li $v0,4
syscall

li $v0,5   # diavasma apo to plhktrologio enos akeraiou  kai apothikeush ston kataxoriti $v0
syscall
move $t1,$v0     #  antigrafei to periexomeno tou kataxoriti $v0 ston kataxoriti $t1


bgt $t0,$zero,Label1  # 1os elexgos an o protos akerzaios>0 ,kai an isxyei tote pigainei sto Label1,an oxi synexizei kato apo thn entolh bgt

sub $t0,$zero,$t0  # afairei apo to 0 thn timh tou kataxoriti $t0 kai thn apothikeyei ston $t0
j Label1




Label1:  # ETIKETA
bgt $t1,$zero,Label2  # 2os elexgos an o deuteros akeraios >0 kai an isxyei tote pigainei sto Label2 ,an oxi synexizei kato apo thn entolh bgt

sub $t1,$zero,$t1  #  afairei apo to 0 thn timh tou kataxoriti $t1 kai thn apothikeyei ston $t1
j Label2


Label2:  # etiketa
beq $t1, $zero, done #an $t1=0 tote teleiwnei to programma
 div $t0, $t1      # kanei ti diairesi kai automata apothikeyei to upoloipo se ena kataxoriti $Hi
 move $t0, $t1     #Antigrafei to periexomenou tou kataxoriti $t1 ston kataxoriti $t0
 mfhi $t1		   #Antigrafei to ipoloipo tis diairesis ston kataxoriti $t1
j Label2



j Label0  # etiketa



Label3:  # etiketa
beq $t1, $zero, done #an $t1=0 tote teleiwnei to programma
 div $t0, $t1      # kanei ti diairesi kai automata apothikeyei to upoloipo se ena kataxoriti $Hi
 move $t0, $t1     #Antigrafei to periexomenou tou kataxoriti $t1 ston kataxoriti $t0
 mfhi $t1		   #Antigrafei to ipoloipo tis diairesis ston kataxoriti $t1
 
 j Label3  # kanei jump sthn etiketa Label3
 
done:  # etiketa
beq $t0, $zero,Label4   #elexgei an  h timh tou $t0 einai ish me 0,an nai phgainei sto label4 ,an oxi tote synexizei kato apo thn entolh

la $a0,message5  #  emfanisi pemptou mhnymatos tupou string
li $v0,4
syscall

move $a0,$t0  # antigrafei to periexomeno tou kataxoriti $t0 ston kataxoriti $a0
li $v0,1
syscall

j Label0  # kanei jump sthn etiketa Label0

Label4:  # etiketa
la $a0,message4
li $v0,4
syscall

j Label0  #  kanei jump sthn etiketa Label0











