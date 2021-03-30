.MODEL SMALL
.STACK 100H
.DATA
    WR DB "Nhap vao mot chuoi: $"
    WR1 DB 10,13,"Chieu dai cua chuoi la: $"
.CODE
MAIN PROC

    ;Tinh chieu dai chuoi nhap vao
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR
    MOV AH,9
    INT 21h
    
    MOV AH,1
    MOV BL,0
WHILE_:
    INT 21h
    CMP AL,0dh
    JE END_WHILE_
    INC BL
    JMP WHILE_
    
END_WHILE_:
    
    LEA DX,WR1
    MOV AH,9
    INT 21h
    
    MOV AH,2
    MOV DL,BL
    OR DL,'0'
    INT 21h

EXIT:
    MOV AH,4CH
    INT 21h
    
MAIN ENDP
    END MAIN