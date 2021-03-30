.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC

    ;Dao nguoc chuoi
    MOV CX,0
    MOV AH,1
WHILE_:
    INT 21h
    CMP AL,0DH
    JE THOAT
    PUSH AX
    INC CX
    JMP WHILE_
    
THOAT:
    
    
    MOV AH,2
    MOV DL,0DH
    
    JCXZ EXIT
    
    INT 21h
TOP:
    POP DX
    INT 21h
    LOOP TOP

EXIT:
    MOV AH,4CH
    INT 21h
    
MAIN ENDP
    END MAIN