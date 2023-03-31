    
   ; This program cheacks if a string is a substring of another string 
    
    
    .MODEL SMALL 
    .STACK 100H
    .DATA
        MSG1        DB      'Enter substring ',0DH,0AH,'$'
        MSG2        DB      0DH,0AH,'Enter mainstring',13,10,'$'
        SUB_STR     DB 80   DUP (0)
        MAIN_STR    DB 80   DUP (0)
        STOP        DW ?
        START       DW ?
        SUB_LEN     DW ?
        YES_MSG     DB      0DH,0AH,'The given string is a substring$'
        NO_MSG      DB      0DH,0AH,'Not a substring$'
        
        
     .CODE 
        MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            MOV ES,AX
            
        ; Prompt for SUB_STR
            MOV AH,9
            LEA DX,MSG1
            INT 21H
            
        ; Read SUB_STR
            LEA DI,SUB_STR
            CALL READ_STR
            MOV SUB_LEN,BX 
            
            
        
        ; Prompt for MAIN_STR    
            MOV AH,9
            LEA DX,MSG2
            INT 21H
                     
            
        ; Read MAIN_STR
            LEA DI,MAIN_STR
            CALL READ_STR  
            
        
        ; See if SUB_STR is a subset of MAIN_STR
            LEA SI,SUB_STR
            LEA DI,MAIN_STR
            CLD
            
        ; Compute stop
            MOV STOP,DI     ; STOP has MAIN_STR address
            ADD STOP,BX     ; ADD MAIN_STR length
            MOV CX,SUB_LEN
            SUB STOP,CX     ; Subtruct SUB_STR length
        
        ; Initialise start
            MOV START,DI    ; Place to the START search
            
            
        REPEAT:
            MOV CX,SUB_LEN
            MOV DI,START
            LEA SI,SUB_STR  ; Reset SI
            REPE CMPSB
            JE YES
            
        ; Substring not found yet
            INC START
        
        ; See if start is <= stop
            MOV AX,START
            CMP AX,STOP
            JNLE NO
            JMP REPEAT
        ; Display results
        
        YES:
            LEA DX,YES_MSG
            JMP DISPLAY
        
        NO:
            LEA DX,NO_MSG
        
        DISPLAY:
            MOV AH,9
            INT 21H
            
        ;DOS EXIT
            MOV AH,4CH
            INT 21H
  MAIN ENDP  
        
        READ_STR PROC
            MOV AH,01H
            XOR BX,BX
            
        INPUT:  
            INT 21H
            CMP AL,13
            JE FINISH
            
            MOV [DI],AL
            INC DI 
            INC BX
            
            JMP INPUT
            
        FINISH:
            MOV [DI],'$'
            RET
           
                   
        
  END MAIN
                 
                
            
            