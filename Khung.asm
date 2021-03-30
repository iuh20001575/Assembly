.MODEL SMALL
.STACK 100h
.DATA
    COUNT DB 0
.CODE
MAIN PROC

    MOV AH,1
    INT 21H
    MOV BL,AL
        
    MOV AH,2
    OR BL,'0'
    ADD BL,5
    MOV DL,BL
    INT 21H
    
THOAT:
    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN