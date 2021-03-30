.MODEL SMALL
.STACK 100H
.DATA
    WR DB "Ban hay nhap vao 3 chu cai dau: $"
    BA DB
    BB DB
    BC DB
.CODE
MAIN PROC

    ;Nhap 3 ki tu, xuat moi ki tu tren 1 dong
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR
    MOV AH,9
    INT 21h
    
    MOV AH,1 ; Nhap 1 ki tu
    INT 21h
    MOV BA,AL
    INT 21h
    MOV BB,AL
    INT 21h
    MOV BC,AL
    
    MOV AH,2    ; Thuc hien xuat 1 ki tu
    
    MOV DL,0AH  ; Xuong dong
    INT 21h ; Thuc hien xuong dong
    
    MOV DL,BA
    INT 21h
    
    MOV DL,0AH
    INT 21h
    
    MOV BL,BB
    MOV DL,BL
    INT 21h
    
    MOV DL,0AH
    INT 21h
    
    MOV BL,BC
    MOV DL,BL
    INT 21h
    
    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN