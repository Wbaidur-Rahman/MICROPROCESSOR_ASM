  ;this program will check a digit weather it is even or odd
  
    .MODEL SMALL
    .STACK 100H
    .DATA
        MSG_1 DB 'Enter N : $'
        MSG_2 DB 13,10,'Prime$' 
        MSG_3 DB 13,10,'Not Prime$'
        
        N DB ?
    .CODE   
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        LEA DX,MSG_1
        MOV AH,9
        INT 21H
        
        MOV AH,1
        INT 21H 
        SUB AL,48 
        MOV N,AL
       
        CMP AL,2
        JE PRIME
        
        MOV CX,3
        MOV AL,3
        
    CHECK:
        CMP AL,N
        JE PRIME
        ADD AL,2
        LOOP CHECK  
        
        
        MOV AH,9
        LEA DX,MSG_3
        INT 21H
        JMP EXIT
    
    PRIME:    
        MOV AH,9
        LEA DX,MSG_2
        INT 21H 
        
    EXIT:
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
    
    END MAIN            