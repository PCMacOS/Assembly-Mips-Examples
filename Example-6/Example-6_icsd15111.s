# Panagiotis-Stephanos Makos icsd15111

.data																# Ακολουθεί δήλωση των string
str: .asciiz " Give temperature "
str1: .asciiz " Dose to plithos ton thermokrasion:  "
str3: .asciiz ": "
str2: .asciiz "\n >> Kinoumenoi mesoi:    "
str4: .asciiz " "
str5: .asciiz "\n >> Average temperatures per "
str6: .asciiz " years:  "

array: .word 0:10											# Δήλωση και αρχικοποίηση πίνακα 10 θέσεων τύπου ακεραίου


.text

main:

	li $s1, 1														# Αρχικοποίηση μετρητή για την get_values
	
	get_values:
		la $a0, str 												# Καταχώρηση string στον $a0
		li $v0, 4													# Εμφάνιση string στην κονσόλα
		syscall
		li $v0, 1													# Eμφάνιση αθροίσματος
		move $a0, $s1										# Εμφάνιση της τιμής που περιέχει ο $s1
		syscall
		la $a0, str3 											# Καταχώρηση string στον $a0
		li $v0, 4													# Εμφάνιση string στην κονσόλα
		syscall
		li $v0, 5													# Ανάγνωση integer από το χρήστη για την πρώτη τιμή της ακολουθίας
		syscall
		move $t1, $v0										# Kαταχώρηση του ακεραίου που αναγνώστηκε στoν καταχωρητή $t1
		sw $t1, array($t0)									# Καταχώρηση της τιμής του $t1 στο πρώτο στοιχείο του πίνακα
		add $t0,$t0, 4										# Αύξηση δείκτη θέσης του πίνακα
		add $s1,$s1,1										# Αύξηση μετρητή επανάληψης
		ble $s1,10,get_values							# Συνθήκη τερματισμού get_values
	
		la $a0, str1												# Καταχώρηση string στον $a0
		li $v0, 4													# Εμφάνιση string στην κονσόλα
		syscall
		li $v0, 5													# Ανάγνωση integer από το χρήστη για την πρώτη τιμή της ακολουθίας
		syscall
		move $t1, $v0										# Kαταχώρηση του ακεραίου που αναγνώστηκε στoν καταχωρητή $t1
	
	la $a0, str2 												# Καταχώρηση string στον $a0
	li $v0, 4														# Εμφάνιση string στην κονσόλα
	syscall	
	li $t7,0														# Αρχικοποίηση τιμών σε καταχωρητές που λειτουργούν ως μετρητές
	li $t5,0
	li $t6,11
	li $t4, 0
	sub $t6,$t6,$t1
	show_mesos:
		move $t0, $t7										# Αντιγραφή της τιμής του καταχωρητή $t7 στον $t0
		li $t2, 0													#	Αρχικοποίηση τιμών σε καταχωρητές που λειτουργούν ως μετρητές
		li $t3,0		
		add_values:											
			lw $t8, array+0($t0)							# Φόρτωση στον καταχωρητή $t8 την εκάστοτε τιμή της θέσης του πίνακα που δείχνει ο $t0
			add $t2, $t2, $t8								# Υπολογισμός αθροίσματος και αποθήκευση στον καταχωρητή $t2
			add $t3,$t3,1										# Αύξηση τιμής μετρητή
			add $t0,$t0, 4									# Αύξηση δείκτη θέσης του πίνακα
		blt $t3,$t1,add_values							# Συνθήκη τερματισμού add_values
		div $t2,$t2,$t1										# Ακέραια διαίρεση
		li $v0, 1													# Eμφάνιση αθροίσματος
		move $a0, $t2										# Εμφάνιση της τιμής που περιέχει ο $t2
		syscall
		la $a0, str4												# Καταχώρηση string στον $a0
		li $v0, 4													# Εμφάνιση string στην κονσόλα
		syscall
		add $t5,$t5,1											# Αύξηση τιμών των μετρητών
		add $t7,$t7,4
		add $t4,$t4,$t2
	blt $t5,$t6,show_mesos							# Συνθήκη τερματισμού της show_mesos
	
	div $t4,$t4,$t6								
	la $a0, str5 												# Καταχώρηση string στον $a0
	li $v0, 4														# Εμφάνιση string στην κονσόλα
	syscall
	li $v0, 1														# Eμφάνιση αθροίσματος
	move $a0, $t1											# Εμφάνιση της τιμής που περιέχει ο $t2
	syscall	
	la $a0, str6 												# Καταχώρηση string στον $a0
	li $v0, 4														# Εμφάνιση string στην κονσόλα
	syscall
	li $v0, 1														# Eμφάνιση αθροίσματος
	move $a0, $t4											# Εμφάνιση της τιμής που περιέχει ο $t2
	syscall	
	
li $v0, 10 														# Tερματισμός προγράμματος									
		syscall	
