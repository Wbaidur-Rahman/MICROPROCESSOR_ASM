; this prog will count the number of vowels consonents digits spaces in a string

    .MODEL SMALL
    .STACK 100H
    
    .DATA
        PROMPT  DB 'Type a string',13,10,'$' 
        NOV     DB 13,10,'Number of vowels :$'
        NOC     DB 13,10,'Number of consonents :$'
        NOD     DB 13,10,'Number of digits :$'
        NOS     DB 13,10,'Number of spaces :$' 
        
        VOWELS  DB 'AEIOUaeiou^$'
        DIGITS  DB '0123456789$'
        
        V    DB  (48)
        C    DB  (48)
        D    DB  (48)
        S    DB  (48)
        
        
    .CODE  
     MAIN PROC
        MOV AX,@DATA    ; initialise ds and es
        MOV DS,AX
        MOV ES,AX
        
        MOV AH,9        ; printing prompt
        LEA DX,PROMPT
        INT 21H
        
        MOV AH,1
        
        INPUT:
            INT 21H
            CMP AL,13
            JE FINISH_INPUT 
            
            CMP AL,32
            JNE NOT_SPACE 
            ADD S,1
        
        NOT_SPACE:     
            
            
            CMP AL,48         
            JL INPUT
            
            CMP AL,57          ; checking the letter if it is a digit
            JG NOT_A_DIGIT
            ADD D,1
            JMP INPUT
            
        NOT_A_DIGIT: 
          
            CMP AL,65
            JL INPUT
            
            MOV CX,11          ; checking the leter if it is a vowel
            LEA DI,VOWELS   
            CLD
            REPNE SCASB 
            
            CMP CX,0
            JE SKIP_VOWEL
            
            ADD V,1
            JMP INPUT
            
              
        SKIP_VOWEL:
                
            CMP AL,90
            JLE CONSONENT
            
            CMP AL,97
            JL INPUT
            
            CMP AL,'z'
            JLE CONSONENT
            
        CONSONENT:
            ADD C,1
            JMP INPUT    
            
                
        
        FINISH_INPUT:            ; taking input and counting finished here        
            LEA DX,NOV  
            CALL PRINT
            
            MOV DL,V
            CALL PRINT_2
            
            LEA DX,NOC
            CALL PRINT
            
            MOV DL,C
            CALL PRINT_2
            
            LEA DX,NOD
            CALL PRINT
            
            MOV DL,D
            CALL PRINT_2
            
            LEA DX,NOS
            CALL PRINT
            
            MOV DL,S
            CALL PRINT_2
            
         EXIT:
            MOV AH,4CH
            INT 21H
            
            
     MAIN ENDP
           
           PRINT PROC
            MOV AH,9
            INT 21H
           RET
           
           PRINT_2 PROC
            MOV AH,2
            INT 21H
           RET
 
 
    END MAIN
        
        