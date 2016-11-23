# 1η Α' άσκηση, Παναγιώτης-Στέφανος Μάκος icsd15111

.data                        # directive toy assembly,apo edo kai kato dilonontai oi metavlites

str: .asciiz "Panagiotis-Stephanos Makos kai Kostas Xrisikopoulos\n"    #metabliti me onoma str,tupou string me ascii xaraktires kai mesa sta " ",toy dinoume timh,to .asciiz mas leei ton tupo tis metavlitis
str1: .asciiz "321/2015111, icsd15223"  #omoios kai me thn metavliti str1




.text   # to programma tototheteitai kato apo thn directive .text

main:    #apo edo kai kato ksekinaei to kurios programma

la $a0,str # gia na ektyposoyme ena string prepei prota na apothikeytei h dieythinsi toy ston kataxoriti $a0,diladi edo h entolh la apothikeyei thn dieythinsi ths metablitis str ston kataxoriri $a0
               

li $v0,4 # ginetai klhsh systhmatos timhs gia ekytposi string,to 4 einai o kodikos klhshs systhmatos,apothikeytetai h timh ths metavlitis str,ston kataxoriti $v0,ayto oysiastika kanei h entolh li
           
            
syscall  # ektyponei to string,thn timh ths metavlitis str,h entolh ayth ektelei mia klhsh systhmatos
     

la $a0,str1 # pali gia an ektyposoume prepei an apothikeysoyme thn dieythinsi ths str1 ston kataxoriti $a0,paromoia h entolh la
              
li $v0,4  #pali ginetai mia klhsh systhmatos gia ektyposi string,paromoia  to 4, h entolh li fortonei thn timh ths metablitis str1,ston kataxoriti $v0
syscall   # ektyponei to string,timh ths str1,entolh toy MIPS,ektelei klhsh systhmatos


li $v0,10  #edo ginetai klhsh systhmatos me kodiko 10 poy antistoixei sthn ekdodo 
syscall   # teleionei h ektelesh me thn entolh syscall