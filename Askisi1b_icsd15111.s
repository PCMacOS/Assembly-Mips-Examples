# 1η Β' άσκηση, Παναγιώτης-Στέφανος Μάκος icsd15111

.data                                          # directive toy assembly,apo edo kai kato dilonontai oi metavlites
str: .asciiz "Eisigage ton proto akeraio\n"   #metabliti me onoma str,tupou string me ascii xaraktires kai mesa sta " ",toy dinoume timh,to .asciiz mas leei ton tupo tis metavlitis
str1: .asciiz "Eisigage ton deutero akeraio\n"   # paromoia gia thn str1
str2: .asciiz "To apotelesma einai : "         #paromoia gia thn str2


.text    # to programma tototheteitai kato thn directive .text


main:    #apo edo kai kato ksekinaei to kurios programma

la $a0,str # entolh la apothikeyei thn dieythinsi ths metavlitis str ston kataxoriti $a0,aparetito gia an ginei ektyposi string
li $v0,4   # h entolh li fortonei thn timh ths str ston kataxoriti $v0,ginetai klhsh systhmatos me kodiko klisis to 4,to 4 dilonei oti tha ginei print_string,mono gia string
syscall    #h entolh ayth ektelei mia klhsh systhmatos,ektuponei thn timh ths str


li $v0,5 #ginetai mia klhsh systhmatos,me kodiko 5 poy antistoixei sto diavasma enos akeraiou,h entolh li tha aothikeusei thn timh pou tha dosoyme ston kataxoriti $v0
syscall  # pragmatopoieitai klhsh systhmatos kai diavazetai o akeraios
move $t0,$v0 #  h entolh move antigrafei thn timh toy kataxoriti toy kataxoriti $v0,ston kataxoriti $t0

la $a0,str1 # paromoaia h entolh la gia thn str1
li $v0,4    #paromoia h entolh li gia emfanisi str1
syscall     # ekteleitai mia klhsh systhmatos,emfanizei thn timh ths str1

li $v0,5  #ginetai klhsh systhmatos gia diavasma toy 2ou akeraiou,paromoia h entolh li
syscall      # pragmatopoieitai klhsh systhmatos,kai diavazetai o 2os akeraios
move $t1,$v0  # h entolh move antigrafei thn timh tou kataxoriti $v0,ston kataxoriti $t1

sub $t0,$t0,$t1  # h entolh ayth pragmatopoiei thn afairesh,diladi afairei apo thn timh toy kataxoriti $t0 , thn timh toy kataxoriti $t1 kai thn apothikeyei ston kataxoriti $t0,to apotelesma diladi

la $a0,str2  #omoios gia emfanisi toy str2
li $v0,4   #omoios pali me thn entolh li ,ginetai klhsh systymatos,kodikos to 4 gia string
syscall  # pragmatopoieitai klhsh systhmatos,emfanizetai h timh ths str2

move $a0,$t0 #h entolh move antigrafei thn timh toy kataxoriti $t0,ston kataxoriti $a0
li $v0,1   # h entolh li apothikeyei thn timh poy exei o kataxoritis $a0,me kodiko klhshs systhmatos to 1,pou antistoixei se ektuposi akeraioy
syscall  # pragmatopoieitai klhsh systhmatos,emfanizei to apotelesma ths afaireshs,thn timh toy kataxoriti $a0

li $v0,10  # edo ginetai klhsh systhmatos me kodiko 10 poy antistoixei sthn ekdodo
syscall  # teleionei h ektelesh me thn entolh syscall