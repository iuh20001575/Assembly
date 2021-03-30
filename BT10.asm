.MODEL SMALL
.STACK 100H
.DATA
    WR DB "**********$"
.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR
    MOV AH,9
    INT 21h

    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN