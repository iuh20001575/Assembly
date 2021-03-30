.MODEL SMALL
.STACK 100H
.DATA
    WR1 DB "Nhap n (0 <= n <= 8): $" 
    WR2 DB 10,13,"Giai thua la: $"    
    X DW ?
    Y DW ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR1
    MOV AH,9
    INT 21H
    
    ;Nhap N
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV AH,0
    MOV X,AX
    
    ;Tinh n!
    MOV AX,X
    MOV BX,AX
WHILE_:  
    CMP BX,1
    JE THOAT  
    DEC BX
    MUL BX
    JMP WHILE_ 
            
THOAT:            
    
    MOV Y,AX
    
    LEA DX,WR2
    MOV AH,9   
    INT 21H
    
    ;Dua n! vao stack
    MOV CX,0     
    MOV AX,Y
CHIA:  
    MOV DX,0    
    MOV BX,0AH
    DIV BX          ; AX / BX -> NGUYEN LUU AX, DU LUU DX
    PUSH DX         ; Cat DX vao stack
    INC CX
    CMP AL,0
    JBE THOATCHIA
    JMP CHIA
    
THOATCHIA:                  
    
   ;In ket qua tu stack
TOP:
    POP DX          ;Lay du lieu tu dinh stack dua vao DX
    MOV AH,2  
    ADD DL,30H
    INT 21H
    DEC CX
    CMP CX,0
    JNE TOP
                 
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
    END MAIN