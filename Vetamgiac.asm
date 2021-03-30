.MODEL SMALL
.STACK 100H
.DATA
    WR1 DB "Nhap N: $"
.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WR1
    MOV AH,9
    INT 21H
    
    ;Nhap n
NHAPN:
    MOV AH,1
    INT 21H
    OR AL,'0'
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    ;In tam giac
    MOV CL,1
    OR CL,'0'
WHILE_:
    MOV AL,1
    OR AL,'0'
    CMP CL,BL
    JL THOATWHILE
    
    LAP:
        CMP AL,CL
        JL THOATLAP
        MOV AH,2
        MOV DL,'*'
        INT 21H
        INC AL
        JMP LAP
      
    THOATLAP:
        
    MOV AH,2
    MOV DL,0AH
    INT 21H
    INC CL
    JMP WHILE_
    
THOATWHILE:
    
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN