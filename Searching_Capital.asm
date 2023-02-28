.MODEL SMALL
.STACK 100H
.DATA
    STR DB 100 ?
    MSG1 DB 'Give input : $'
    MSG2 DB 'FIRST CAPITAL : $'  
    MSG3 DB 'LAST CAPITAL : $'
    MSG4 DB 'NO CAPITAL$'

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX 
                 
                 
        ;PRINTING MASSAGE 1
        MOV AH,09H
        LEA DX,MSG1
        INT 21H
        
        
        ;TAKING INPUT
        MOV SI,OFFSET STR        
        MOV AH,01H
        
        INPUT:
           INT 21H 
           CMP AL,0DH
           JZ ADD_$
           
           MOV [SI],AL
           INC SI
        JMP INPUT
            
        ADD_$:
            MOV [SI],'$'   
            
        ;TAKING INPUT DONE
          
                        
        CALL NEW_LINE
        
        
        
        MOV CX,0
        MOV SI,OFFSET STR   
        
        START:
            MOV AL,[SI]
            CMP AL,'$'
            JE LEVEL2
            
            CMP AL,65
            JL NOT_APPLICABLE
            
            CMP AL,91
            JL PRINT 
        JMP NOT_APPLICABLE
                 
                 
        LEVEL1:
            MOV BH,AL
            INC CX
            
        NOT_APPLICABLE:
            INC SI
        JMP START
          
        
        ;PRINTING FIRST CAPITAL LETTER
        PRINT:
            CMP CX,0
            JNE LEVEL1
            
            MOV BH,AL
            
            MOV AH,09H
            LEA DX,MSG2
            INT 21H 
            
            INC CX 
            MOV AH,02H
            MOV DL,BH
            INT 21H
            INC SI 
            CALL NEW_LINE
         JMP START
            
           
            
         ;PRINTING LAST CAPITAL LETTER
        LEVEL2:
            CMP CX,1
            JLE EXIT
            
            MOV AH,09H
            LEA DX,MSG3
            INT 21H 
           
            MOV AH,02H
            MOV DL,BH
            INT 21H
            CALL NEW_LINE
        JMP EXIT 
        
        
        LEVEL3:
            MOV AH,09H
            LEA DX,MSG4
            INT 21H
       JMP EXIT1
            
        
        
        EXIT:
        CMP CX,0
        JE LEVEL3
        
        
        EXIT1:
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