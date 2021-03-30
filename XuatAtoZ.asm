.MODEL SMALL
.STACK 100H
.DATA
    WR DB "XUAT TU A->Z: $"
    WR1 DB 10,13,"XUAT TU Z->A: $"
.CODE
MAIN PROC

    ;In ki tu tu A->Z va nguoc lai
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR
    MOV AH,9
    INT 21H

    MOV BL,'A'
WHILE_:
    MOV AH,2
    MOV DL,BL
    INT 21H
    INC BL
    CMP BL,'Z'
    JBE WHILE_
    
    LEA DX,WR1
    MOV AH,9
    INT 21H
    
    MOV BL,'Z'
WHILE1_:
    MOV AH,2
    MOV DL,BL
    INT 21H
    DEC BL
    CMP BL,'A'
    JNB WHILE1_
    
    MOV DL,0AH
    INT 21H

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN