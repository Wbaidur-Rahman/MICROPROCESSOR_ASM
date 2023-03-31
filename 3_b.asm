    ; this code will read a string as input then sort it increasing order
    
    .MODEL SMALL
    .STACK 100H
    .DATA
        STR DB 'DBCABCD$'
        
    .CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX 
        LEA SI,STR 
        MOV BX,7
        CALL SELECT
        
        
        MOV AH,9
        LEA DX,STR
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
     MAIN ENDP 
    
        SELECT PROC 
            
            DEC BX
            JE END_SORT
            MOV DX,SI
            
        SORT_LOOP:
            MOV SI,DX
            MOV CX,BX
            MOV DI,SI
            MOV AL,[DI]
            
        FIND_BIG:
            INC SI
            CMP [SI],AL
            JG NEXT
            MOV DI,SI
            MOV AL,[DI]
        
        NEXT:
            LOOP FIND_BIG
            
            CALL SWAP
            DEC BX
            JNZ SORT_LOOP
            
        END_SORT:
            
            RET
        SELECT ENDP
        
        SWAP PROC
            PUSH AX
            MOV AL,[SI]
            XCHG AL,[DI]
            MOV [SI],AL
            POP AX
            RET
        SWAP ENDP
            
        
            
    END MAIN
      