.MODEL SMALL
.STACK 100H
.DATA
    STR DB 100 ?
    MSG1 DB 'Give input : $'

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
        
         
        ;CALLING CASE CONVERSION FUNCTION
        CALL CASE_CONVERSION
                  
        MOV AH,09H
        LEA DX,STR
        INT 21H
           
           
           
        EXIT:
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
        
      ;CASE CONVERSION START 
        
    CASE_CONVERSION PROC
        MOV SI,OFFSET STR
        START:  
        
            CMP [SI],'$'
            JE RETURN
            CMP [SI],65
            JL INDEX
            CMP [SI],91
            JL GREATER
            CMP [SI],97
            JL INDEX
            CMP [SI],122
            JL SMALLER 
            
            INC SI
         JMP START
            
            
            
        INDEX:
           INC SI
        JMP START  
        
        GREATER:
           ADD [SI],32
           INC SI
        JMP START 
        
        SMALLER:
            SUB [SI],32
            INC SI
        JMP START 
        
        RETURN:
            RET
        
        ;END OF CASE CONVERSION
            
    
END MAIN