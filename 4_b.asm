  ;this program will calculate the factorial of some digits
  
    .MODEL SMALL
    .STACK 100H
    .DATA
        MSG_1 DB 'Enter N : $'
        MSG_2 DB 13,10,'Factorial : $'
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
               
        XOR CX,CX
        SUB AL,48       
        MOV CL,AL
        MOV AL,1
        
    FACTORIAL:
        MUL CL
        LOOP FACTORIAL 
        MOV BL,AL
        
        LEA DX,MSG_2
        MOV AH,9
        INT 21H
        
        ADD BL,48
        
        MOV AH,2
        MOV DL,BL
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
    
    END MAIN            