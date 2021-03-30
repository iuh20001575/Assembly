.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    MOV AH,2
    MOV DL,'a'
    INT 21h
    
    MOV DL,0AH
    INT 21h
    
    MOV AH,1
    INT 21h
    
    MOV AH,2
    MOV DL,'a'
    INT 21h

MAIN ENDP

END MAIN