# Panagiotis-Stephanos Makos icsd15111

.data

str:  .asciiz "Parakalo dose to plithos ton oron ths akolouthias fibonacci pou epithumeis na ektupothoun :\n" #metavliti tupou string poy tha emfanisei to mhnyma
str1: .asciiz  " " # metavliti tupou string ,emfanizei keno

.text 

main:

la $a0,str # emfanisei thn timh ths metavlitis str
li $v0,4  # entolh klhsh systhmatos gia print_string,me kodiko klhsh systhmatos 4
syscall  # pragmatopoieitai klhsh systhmatos
 
li $v0,5 # entolh klhshs systhmatos gia read_int ,me kodiko klhshs systhmatos 5
syscall # pragmatopoieitai klhsh systhmatos
move $t0,$v0 # anrigrafei to periexomeno tou kataxoriti $v0, ston $t0,ayto pou edose o xrhsths sto plhktrologio

li $s0,0 # metritis epanalipseon loop counter,arxikopoieitai me 0

li $s1,0 # o protos oros kai arxikopoieitai me 0,einai statheros

li $s2,1 # o deuteros oros kai arxikopoietai me 1,einai statheros

li $s3,0 # sum,ekei apothikeyetai kathe fora to athroismaaa kathe foraa


sum_loop: # arxizei to loop,(epanalipsi)

move $a0,$s1   # antigrafei to periexomeno tou $s1 ston $a0,gia na emfanisei to 0,ton proto oror diladi    
li $v0,1  #emfanizei to 0 print_int me kodiko klhshs systhmatos 1
syscall

add $s3,$s2,$s1   #ypologizei thn akoloythia, prosthetei tous 2 prohgoumenous orous kathe fora ston $s3 diladi einai peripou $s3=$s2+$s1

move $s1,$s2 #Antigrafei to periexomeno tou kataxoriti $s2 ston kataxoriti $s1
move $s2,$s3 #Antigrafei to periexomeno tou kataxoriti $s3 ston kataxoriti $s2


la $a0,str1  #emfanizei to keno kathe fora metaksi ton arithmwn ths akolouthias
li $v0,4     #entolh klhsh systhmatos gia print_string,me kodiko klhsh systhmatos 4
syscall   # pragmatopoieitai klhsh systhmatos

addi $s0,$s0,1    # auksanei ton metriti epanalipsis kata ena kathe fora ,$s0=$s0+1 
blt $s0,$t0,sum_loop   # edo teleionei to loop kai elexgei thn sinthiki ean $s0<$t0 tote phgainei sto label sum_loop kai ksanampainei sthn epanalipsi


li $v0,10  #exodos        
syscall     #pragmatopoiei thn klhsh systhmatos thn eksodo diladi         
