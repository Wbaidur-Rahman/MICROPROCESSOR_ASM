; this code takes a string as input and then gives reverse output [ stack implementation ]


.MODEL SMALL
.STACK 100H
.DATA        
    REV DB 100 ?
    STR DB 100 ?  
    LENGTH DB ?
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
           INC CX     
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
                
                    
        MOV AH,09H
        LEA DX,REV
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
        
      ;REVERSE FUNCTION  
      REVERSE PROC
         MOV SI,OFFSET STR
         XOR CX,CX  
        
        START:  
          MOV AX,[SI]
          CMP AL,'$'
          JE STACK_DONE 
          
          PUSH [SI]
          INC SI
          INC CX
        JMP START
                        
       
        STACK_DONE:
            MOV SI,OFFSET REV 
            
        LEVEL: 
            CMP CX,0
            JE  RETURN
            
            POP DX  
            XOR DH,DH
            
            MOV [SI],DX 
            INC SI
            DEC CX
        JMP LEVEL
        
        RETURN:   
        MOV [SI],'$'
        RET
        
        
      ;END OF REVERSE FUNCTION
            
    
END MAIN