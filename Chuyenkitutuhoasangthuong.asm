.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC

    ;Nhap 1 ki tu thuong va chuyen thanh hoa
    MOV AH,1
    INT 21h
    SUB AL,20h
    MOV BL,AL
    MOV AH,2
    MOV DL,0ah
    INT 21h
    MOV DL,BL
    INT 21h
    
    ;Chuyen ki tu sang thuong
    ADD BL,20h
    MOV DL,0ah
    int 21h
    MOV DL,BL
    INT 21h
    
EXIT:
    MOV AH,4CH
    INT 21h
    
MAIN ENDP
    END MAIN