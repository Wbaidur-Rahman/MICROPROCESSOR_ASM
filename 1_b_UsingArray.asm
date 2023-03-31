; this code take a string as input and then gives reverse output 


.MODEL SMALL
.STACK 100H
.DATA
    STR DB 100 ?
    REV DB 100 ?
    MSG1 DB 'Give input : $' 
    MSG2 DB 'Reversed Output : $'

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX 
                 
                 
        ;PRINTING MASSAGE 1
        MOV AH,09H
        LEA DX,MSG1
        INT 21H 
        
        XOR CX,CX
        
        
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
        ;PRINTING MASSAGE 2
        MOV AH,09H
        LEA DX,MSG2
        INT 21H 
         
        ;CALLING CASE CONVERSION FUNCTION
        CALL REVERSE
        
           
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
        
      ;REVERSE FUNCTION
        
    REVERSE PROC 
        DEC SI
        
        START:  
          CMP SI,0
          JL RETURN
          
          MOV AH,02H
          MOV DL,[SI]
          INT 21H
          
          DEC SI
          
        JMP START
             
        
        RETURN:
            RET
        
      ;END OF REVERSE FUNCTION
            
    
END MAIN