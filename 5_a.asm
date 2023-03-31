  ;this program will check a digit weather it is even or odd
  
    .MODEL SMALL
    .STACK 100H
    .DATA
        MSG_1 DB 'Enter N : $'
        MSG_2 DB 13,10,'Even$' 
        MSG_3 DB 13,10,'Odd$'
        
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
               
        TEST AL,1
        JE EVEN 
        
        MOV AH,9
        LEA DX,MSG_3
        INT 21H
        JMP EXIT
    
    EVEN:    
        MOV AH,9
        LEA DX,MSG_2
        INT 21H 
        
    EXIT:
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
    
    END MAIN            