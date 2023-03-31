; this program will take a string as input and then print the first capital and last capital alphabetically


.MODEL SMALL
.STACK 100H
.DATA
    STR DB 150 ?
    MSG1 DB 'Type a line of text: $'
    MSG2 DB 'First capital : $'  
    MSG3 DB 'Last capital : $'
    MSG4 DB 'No capital $'
    FIRST DB '['
    LAST DB '@'

.CODE
    MAIN PROC   
    ; Initialise the ds
        MOV AX,@DATA
        MOV DS,AX 
                 
                 
    ;Printing message 1
        MOV AH,09H
        LEA DX,MSG1
        INT 21H
        
        
    ;Taking input        
        MOV AH,01H
        
        INPUT:
           INT 21H 
           CMP AL,0DH
           JE END_INPUT
           
           CMP AL,'A'        ; CHECKING FOR CAPITAL LETTER
           JL INPUT 
           CMP AL,'Z'        
           JG INPUT 
           
           
           CMP AL,FIRST
           JG CHECK_LAST ; CHECKING FIRST CAPITAL
           MOV FIRST,AL
           
         CHECK_LAST:
           CMP AL,LAST
           JL INPUT
           MOV LAST,AL 
            
        JMP INPUT  
        
                
     ; Input taking finished 
          
                       
         END_INPUT: 
            CALL NEW_LINE
            
            CMP FIRST,'['
            JE NOCAPITAL 
         
              
            
     ; Printing first capital letter 
            MOV AH,09H
            LEA DX,MSG2
            INT 21H
            MOV DL,FIRST
            MOV AH,02H
            INT 21H   
            
            CALL NEW_LINE
            
            
     ; Printing Last capital letter 
            MOV AH,09H
            LEA DX,MSG3
            INT 21H
            MOV DL,LAST
            MOV AH,02H
            INT 21H  
            JMP EXIT
                   
          NOCAPITAL: 
            MOV AH,9
            LEA DX,MSG4
            INT 21H 
            
            
         
          EXIT:
            MOV AH,4CH
            INT 21H
            
            
        MAIN ENDP
        
        NEW_LINE PROC
            MOV AH,02H
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H 
            RET         
        
    END MAIN