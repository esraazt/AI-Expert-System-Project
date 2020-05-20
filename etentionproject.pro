facts 
xinfected(symbol)
xninfected(symbol)

DOMAINS

choice =integer
%name=symbol
x=symbol




PREDICATES
start - determ ()
menu -determ()
menu2 -determ()
user_choice(choice)-determ(i)
%user_name(name)-determ(i)
user_choice2(choice)-determ(i)
disease(x) - nondeterm (o) 
ask(x,x) - determ (i,i) 
ans(x,x) - determ (i,i) 
infected(x) - determ(i) 
ninfected(x) - determ(i) 
clear - determ () 




CLAUSES

disease("hypertension"):-
   infected("-do you have trouble in sleeping or anxiety?[y/n]"),nl,
   infected("-do you have severe or unusual headache?[y/n]"),nl,
   infected("-do you feel like having tightness, heavy or crushing pain in your chest?[y/n]"),nl,
   infected("-does your nose bleed a lot?[y/n]").
    	
disease("hypotension"):-
   infected("-when you are walking do you feel unsteady?[y/n]"),nl,
   infected("-do you have blurred vision (loss of sharpness of eyesight)?[y/n]"),nl,
   infected("-do you have difficulty on concentrating?[y/n]"),nl,
   infected("-do you feel tired or lack of energy ? drowsy?[y/n]").
    
              
infected(Y):- 
   xinfected(Y),!.
           
infected(Y):- 
   not(xninfected(Y)),ask(Y,yes).
           
ninfected(Y):- 
   xninfected(Y),!.
           
ninfected(Y):- 
   not(xinfected(Y)),ask(Y,no).
          
ask(Y,yes):- 
   !,nl,write(Y),readln(Replay),nl,
    frontchar(Replay,'y',_),ans(Y,yes).
    
ask(Y,no):- 
   !,nl, write(Y),readln(Replay),nl,
   frontchar(Replay,'y',_),ans(Y,no).
            
ans(Y,yes):- 
   assertz(xinfected(Y)).
      
ans(Y,no):- 
   assertz(xninfected(Y)).
   
   
%////////////////////////////advice menu////////////////////////////////////      
user_choice2('4'):-
    clear.
user_choice2('3'):-  
    menu.
user_choice2('2'):-
   nl,write("-------------------advices for hypertension----------------------"),nl,
   write("eat some fruits such as apple, banana or orange"),nl,
   write("do aerobics and cardio for 30 minutes\n"),
   write("----------------------------------------------------------------------------------"),nl,menu2. 
   
user_choice2('1'):-
  nl,write("--------------------------advices for hypotension---------------------------"),nl,
  write("eat something salty\n"),
  write("avoid heavy lifting and have some rest you deserve it !\n"),
  write("-------------------------------------------------------------------------------------------"),nl,menu2.
  
menu2:-
        nl,write("            --------------------advice menu------------------------------"),nl,
	write("            Enter 1 if you want advices for hypotension \n"),
	write("            Enter 2 if you want advices for hypertension\n"),
	write("            Enter 3 to get back to main menu \n"),
	write("            Enter 4 to exit \n"),
	write("            ----------------------------------------------------------------------"),nl,
	write("            Enter number - "),
	readchar(Z) , write(Z), nl,
	user_choice2(Z), nl.
	
	
%///////////////////exit function///////////////////////////////      
 clear:- 
    write("\n wish you a life full of health, good bye.. "),
    exit.
    
%/////////////////// printing diagnosis result ////////////////////////    
 start:- 
    disease(X),!,
    write("\n------------     Under diagnosis . . . .  ----------------"),nl,
    %write("\n DEAR",E),
    write("\n  The diagnosis indicates that you have ",X),
    write("\n\n    Get well soon   :) "),nl,
     write("\n---------------------------------------------------------------------\n")
    ,menu.
    
 start:-
    write("\n------------     Under diagnosis . . . .  ----------------\n"), 
    write("\n it seems that you are uninfected , take care  \n"),
     write("\n---------------------------------------------------------------------\n"),
    nl,menu.    
    
    
%////////////////////////////main menu////////////////////////////////////      
user_choice('3'):-  
  clear.
         
user_choice('2'):-
  menu2.
     
user_choice('1'):-
nl,write("Please answer the questions with yes or no to see the dignoses ") ,nl,
write("---------------------------------------------------------------"),nl,
 start.
   
 
menu:-      
  
	write("\n            -------------------- main menu -------------------"),nl,
	write("            Enter 1 for dignoses \n"),
	write("            Enter 2 to show advice\n"),
	write("            Enter 3 to exit\n"),
	write("            ----------------------------------------------------------"),nl,
	write("            Enter number - "),
	readchar(W) , write(W), nl,
	user_choice(W), nl,
	menu.

  
GOAL
write("******** welcome to Etention Expert system ********"), nl

,menu.

