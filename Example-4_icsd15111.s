# Panagiotis-Stephanos Makos icsd15111
.data
array1: .word 0:20  #dilwsi pinaka 20 thesewn kai arxikopoihsh
string0: .asciiz "Dose ton prwto oro tis akolouthias\n"
string1: .asciiz "Dose to vima tis proodou\n"
string2: .asciiz "\nAthroisma orwn: "
space: .asciiz " "


.text
main:

la $a0,string0 #emfanish prwtou string
li $v0,4
syscall

li $v0,5 #Diavasma prwtou orou
syscall
move $t1,$v0

la $a0,string1 #Emfanish deuterou string
li $v0,4
syscall

li $v0,5 #Diavasma vimatos
syscall
move $t2,$v0


li $s0,0 #metritis epanalipsis
li $t3,0 #sum
la $t0,array1 #kataxoritis deikths


loopA:

sw $t1,($t0) #array1[i]=$t1
add $t3,$t3,$t1 #sum=sum+array1[i]
sw $t1,($t0) #array1[i]=$t1
add $t1,$t1,$t2 #ipologizei ton epomeno oro
add $s0,$s0,1  # afksanei ton metriti epanalipsis
add $t0, $t0, 4 #afksanei ton kataxoriti deikth kata 4 theseis

blt $s0,20,loopA  #elegxos epanalipsis


li $s0,20 #metritis epanalipsis
la $t0,array1+76 #kataxoritis deikths, deixnei sto teleutaio stoixeio tou pinaka
loopB:

lw $a0,($t0) #Emfanish orou
li $v0,1
syscall

la $a0, space #Emfanish kenou anamesa stous orous 
li $v0, 4                       
syscall

sub $t0,$t0,4  #meiwnei ton kataxoriti deikth kata 4 theseis
sub $s0,$s0,1

bgt $s0,0,loopB #elegxos epanalipsis

la $a0,string2 #emfanish string
li $v0,4
syscall

move $a0,$t3 # emfanish athroismatos
li $v0,1
syscall

li $v0,10 #exodos
syscall















