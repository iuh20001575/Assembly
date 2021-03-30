.MODEL SMALL
.STACK 100H
.DATA
    WR1 DB "Nhap A: $" 
    WR2 DB 10,13,"Nhap B: $"
    WR3 DB 10,13,"Tong A va B la: $"     
    WR4 DB 10,13,"Hieu A va B la: $"  
    WR5 DB 10,13,"Tich A va B la: $"
    WR6 DB 10,13,"Thuong A va B la: $"
    TAM DW ?
    A DW ? 
    B DW ?
    Y DW ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;Nhap so A
    LEA DX,WR1
    MOV AH,9
    INT 21H
    
    CALL NHAP
    MOV AX,TAM
    MOV A,AX 
    
    ;Nhap B       
    LEA DX,WR2
    MOV AH,9
    INT 21H
    
    CALL NHAP
    MOV AX,TAM
    MOV B,AX      
    
    ;Tinh tong A va B
    LEA DX,WR3
    MOV AH,9
    INT 21H
    MOV AX,A 
    ADD AX,B     
    CALL XUAT
    
    
    ;Tinh hieu A va B  
    LEA DX,WR4
    MOV AH,9
    INT 21H
    MOV AX,A 
    SUB AX,B      
    CALL XUAT
    
    ;Tinh tich A va B   
    LEA DX,WR5
    MOV AH,9
    INT 21H
    MOV AX,A
    MOV BX,B
    MUL BX
    CALL XUAT
    
    ;Tinh thuong A va B
    LEA DX,WR6
    MOV AH,9
    INT 21H
    MOV AX,A
    MOV BX,B
    DIV BL  
    CALL XUAT
                
    MOV AH,4CH
    INT 21H
    
MAIN ENDP 

;CTC nhap so
NHAP PROC 
    MOV TAM,0
    NHAPA:
    MOV AH,1
    INT 21H
    CMP AL,13
    JE THOATNHAPA 
    SUB AL,30H 
    XOR AH,AH 
    MOV Y,AX
    MOV AX,TAM
    MOV BX,10
    MUL BX
    ADD AX,Y
    MOV TAM,AX
    JMP NHAPA 
    
THOATNHAPA:
    
    RET 
    
NHAP ENDP

;CTC xuat so
XUAT PROC
   MOV CX,0     
    MOV AX,AX
CHIA1:  
    MOV DX,0    
    MOV BX,0AH
    DIV BX          ; AX / BX -> NGUYEN LUU AX, DU LUU DX
    PUSH DX         ; Cat DX vao stack
    INC CX
    CMP AL,0
    JBE THOATCHIA1
    JMP CHIA1
    
THOATCHIA1:                  
    
TOP1:
    POP DX          ;Lay du lieu tu dinh stack dua vao DX
    MOV AH,2  
    ADD DL,30H
    INT 21H
    DEC CX
    CMP CX,0
    JNE TOP1
    RET
XUAT ENDP 
    

END MAIN