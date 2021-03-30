.MODEL SMALL
.STACK 100H
.DATA
    WR DB "Nhap N: $" 
    WR1 DB 10,13,"Khong phai so nguyen to$" 
    WR2 DB 10,13,"N la so nguyen to$"
    N DW ?
    Y DW ?
.CODE
MAIN PROC
    
   MOV AX,@DATA
   MOV DS,AX
   
   LEA DX,WR
   MOV AH,9
   INT 21H 
   
NHAP:
    MOV AH,1
    INT 21H
    CMP AL,13
    JE THOATNHAP
    SUB AL,30H 
    MOV AH,0
    MOV Y,AX
    MOV AX,N
    MOV BX,10
    MUL BX
    ADD AX,Y
    MOV N,AX
    JMP NHAP 
    
THOATNHAP:
   
   MOV CX,2
WHILE_:
   MOV AX,N
   DIV CX
   MUL CX 
   CMP CX,N
   JE INKQ
   CMP AX,N
   JE THOATWHILE
   
INKQ:
    LEA DX,WR2
    MOV AH,9
    INT 21H
    JMP ENDPRO
    
     
THOATWHILE:
   LEA DX,WR1
   MOV AH,9
   INT 21H 
   JMP ENDPRO
   

ENDPRO:
   MOV AH,4CH
   INT 21H 
    
MAIN ENDP