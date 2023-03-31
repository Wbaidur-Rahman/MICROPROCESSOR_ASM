
    ; this code take a string as input then find out the largest value 
    .MODEL SMALL
    .STACK 100H
    
    .DATA
        M1 DB 'Enter a string of numbers : $'
        A  DB 80 DUP (0)
        M2 DB 13,10,'Largest number : $'
    
    .CODE
        MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            
            MOV AH,9
            LEA DX,M1
            INT 21H 
            
            LEA SI,A
        
        INPUT:    
            MOV AH,1           ; taking input
            INT 21H
            CMP AL,13
            JE END_INPUT
            
            MOV [SI],AL
            INC SI
            JMP INPUT
            
       END_INPUT:
            MOV [SI],'$'
            
            MOV AH,9            ; printing output
            LEA DX,M2
            INT 21h
              
            LEA DI,A
            MOV BL,[DI]
            INC DI
             
         LARGEST:       
            CMP [DI],'$'
            JE EXIT
            CMP [DI],BL
            JLE SKIP
            MOV BL,[DI]
            
        SKIP:    
            INC DI
            JMP LARGEST   
            
        EXIT:
            MOV AH,2
            MOV DL,BL
            INT 21H
               
            MOV AH,4CH
            INT 21H
        MAIN ENDP
    END MAIN    