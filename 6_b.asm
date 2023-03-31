                     
    ; this code take a string as input then sort it in ascending order      
    
    .MODEL SMALL
    .STACK 100H
    
    .DATA
        M1 DB 'Enter a string of numbers : $'
        A  DB 80 DUP (0)
        M2 DB 13,10,'After sort : $'
    
    .CODE
        MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            
            MOV AH,9
            LEA DX,M1
            INT 21H 
            XOR BX,BX
            
            LEA SI,A
        
        INPUT:    
            MOV AH,1           ; taking input
            INT 21H
            CMP AL,13
            JE END_INPUT
            
            MOV [SI],AL
            INC SI
            INC BX
            JMP INPUT
            
       END_INPUT:
            MOV [SI],'$'
            
            MOV AH,9            ; printing output
            LEA DX,M2
            INT 21h
              
            
            DEC BX
            
        SORT:
            CMP BX,0
            JE EXIT 
            
            
            LEA DI,A  
            MOV SI,DI
            MOV AL,[DI]
            INC DI
            
            MOV CX,BX   
             
        LARGEST:       
            
            CMP [DI],AL
            JLE SKIP 
            MOV SI,DI
            MOV AL,[DI]
            
        SKIP:    
            INC DI
            LOOP LARGEST
               
            DEC DI
            CALL SWAP
            DEC BX
            JMP SORT   
            
        EXIT:
            MOV AH,9
            LEA DX,A
            INT 21H
               
            MOV AH,4CH
            INT 21H
        MAIN ENDP 
        
        SWAP PROC 
            PUSH SI
            PUSH DI
            MOV AL,[SI]
            XCHG AL,[DI]
            MOV [SI],AL
            POP SI
            POP DI
            RET
    END MAIN    