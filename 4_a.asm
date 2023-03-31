  ;this program will calculate the series summation of some digits
  
    .MODEL SMALL
    .STACK 100H
    .DATA
        MSG_1 DB 'Enter N : $'
        MSG_2 DB 13,10,'Summation : $'
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
        MOV BL,48 
        MOV BH,1
        
    SUMATION:
        ADD BL,BH
        INC BH
        LOOP SUMATION 
        
        LEA DX,MSG_2
        MOV AH,9
        INT 21H
        
        MOV AH,2
        MOV DL,BL
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
    
    END MAIN            