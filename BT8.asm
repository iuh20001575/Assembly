.MODEL SMALL
.STACK 100h

.CODE
MAIN PROC

    ;Hien thi dau ?
    MOV AH,2
    MOV DL,'?'
    INT 21h

    
    
MAIN ENDP
END MAIN