.MODEL SMALL
.STACK 100H
.DATA
    WR DB "**********",10,13,"$"
.CODE
MAIN PROC

    ;Ve hinh vuong 10x10 bang *
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR
    MOV AH,9
    MOV CX,0
WHILE_:
    INT 21h
    INC CX
    CMP CX,10
    JL WHILE_

    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN