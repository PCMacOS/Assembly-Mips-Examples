# Panagiotis-Stephanos Makos icsd15111

.data

ARRAY: .word 0:10
MESSAGE_1: .asciiz "Give integer  "
MESSAGE_2: .asciiz ": "
MESSAGE_3: .asciiz "Unsorted array :"
MESSAGE_4: .asciiz "Sorted array : "
NEW_LINE: .asciiz "\n"
SPACE: .asciiz " "

.text
main:

li $t1,1             # metritis epanalipsis,arxikopoihsh tou kataxoriti t1 me thn timh 1
la $t0,ARRAY         # kataxoritis deiktis pou deixnei sthn arxi tou pinaka <ARRAY>

Label1:              #etiketa epanalipsis

	la $a0,MESSAGE_1  #emfanisi protou string
	li $v0,4          #kodikos klhshs systhmatos 4 gia emfanisi string
	syscall           #klhsh systhmatos

	move $a0,$t1      #antigrafetai to periexomeno tou metriti epanalipsis t1 ston kataxoriti $a0
	li $v0,1          #kodikos klhshs systhmatos 1 gia emfanisi akeraiou(print_int)
	syscall           #klhsh systhmatos

	la $a0,MESSAGE_2  #Emfanish 2ou string  
	li $v0,4		  #kodikos klhshs systhmatos 4 gia emfanisi string
	syscall           #klhsh systhmatos

	li $v0,5		  #kodikos klisi systhmatos 5 gia diavasma akeraiou
	syscall			  #klisi systhmatos
	sw $v0,($t0)      #apothikeuei akeraiou apo ton kataxoriti $v0, ston pinaka

	add $t0,4		 #auksish tou kataxoriti deikth t0 kata 4 gia na deixnei sthn epomenh thesi tou pinaka
	add $t1,1        #auksish tou metriti epanalipsis kata 1

blt $t1,11,Label1    #elegxos epanalipsis(elexgei an to $t1<11 kai an nai tote phgainei sto Label1)

li $t1,1       #metritis epanalipsis,arxikopoihsh tou kataxoriti t1 me thn timh 1  
la $t0,ARRAY   #kataxoritis deiktis pou deixnei sthn arxi tou pinaka <ARRAY>
li $t2, 0      #metritis emfanisewn

print:  #etiketa

	add $t2,$t2,1      #auksanei to metriti emfaniseon $t2 kata 1
	beq $t2,2,print2   # elexgei ean $t2=2 kai an nai tote phgainei sthn etiketa print2

	la $a0,MESSAGE_3   #Emfanish 3ou string
	li $v0,4           #kodikos klhshs systhmatos 4 gia emfanisi string
	syscall            #klhsh systhmatos

	la $a0,NEW_LINE    #Emfanish 4ou string
	li $v0,4           #kodikos klhshs systhmatos 4 gia emfanisi string
	syscall            #klhsh systhmatos

print1:   #etiketa

	lw $a0,($t0)  #fortonei mto periexomeno tou kataxoriti $t0 ston kataxoriti $a0
	li $v0,1      #klhsh systhmatos me kodiko 1 gia emfanisi akeraiou
	syscall       #klhsh systhmatos

	la $a0,SPACE   #emfanisi string SPACE
	li $v0,4	   #kodikos klhshs systhmatos 4 gia emfanisi string
	syscall        #klhsh systhmatos

	add $t1,1    #auksanei ton metriti epanalapsis kata 1
	add $t0,4    #auksanei ton kataxoriti deikth kata 4 gia na deixnei sthn epomenh thesi tou pinaka

blt $t1,11 print1  #elegxei an $t1<11 kai an isxiei pigainei sthn print1

li $t1,0 #arxikopoiei thn timh 0 ston kataxoriti $t1 (i=0)

A:
	la $t0,ARRAY #kataxoritis deikth pou deixnei sto prwto stoixeio tou pinaka
	li $t3,0     #arxikopoiei thn timh 0 ston kataxoriti $t3 (j=0)
B:
	lw $s1,($t0)  #o kataxoritis $s1 pernei thn timh enos stoixeiou tou pinaka (temp1=array[i])
	add $t0,4     # o kataxoritis deikths auksanetai kata 4 wste na deixnei sto epomeno stoixeio 
	lw $s2,($t0)  #o kataxoritis $s2 pernei thn timh tou epomenou stoixeiou tou pinaka (temp2=array[i+1])
	add $t3,1     # j++
	bgt $s1,$s2,swap   #an $s1>$s2 tote pigainei sto swap
Cont:  				#etiketa sinexeias
ble $t3,9,B			#elegxos epanalapsis (oso $t3<=9 tote pigainei sto B)
	add $t1,1       #i++
blt $t1,10,A        #elegxos epanalapsis (oso $t1<10 tote pigainei sto A)

j print  #kanei alma sthn etiketa print

print2:
	li $t1,1  #metritis epanalipsis
	la $t0,ARRAY #kataxoritis deikths

	la $a0,MESSAGE_4  #Emfanish 4ou string
	li, $v0,4		  #klhsh systhmatos me kodiko 4 gia emfanish string
	syscall			  #klhsh systhmatos

print3:		 #etiketa epanalipsis print3

	lw $a0,($t0)   #Emfanish orou pinaka
	li $v0,1       #Klhsh systhmatos me kodiko 1 gia emfanish akeraiou
	syscall        #klhshs systhmatos

	la $a0,SPACE  #emfanish kenou
	li $v0,4      #kodikos klhshs systhmatos gia emfanish string
	syscall       #klhshs systhmatos

	add $t1,1    #auksanei ton metriti epanalapsis kata 1
	add $t0,4    #auksanei ton kataxoriti deikth kata 4 gia na deixnei sthn epomenh thesi tou pinaka

blt $t1,11 print3 #elegxos epanalipsis(an $t1<11 pigainei sthn etiketa print3)

li $v0,10  #kodikos klhshs systhmatos gia exodo
syscall    #klhshs systhmatos

swap:	          #etiketa antimetathesis
	sw $s1,($t0)  #apothikeuei ton temp1 sto array+1
	sub $t0,4     #Afairei ton kataxoriti deikth kata 4 wste na deixnei sto prohgoumeno stoixeio tou pinaka 
	sw $s2,($t0)  #apothikeuei ston temp2 sto array
j Cont            #kanei alma sthn Cont

