.MODEL SMALL
.STACK 100h
.DATA

.CODE
MAIN PROC

    ;In ki tu nhap tu ban phim 80 lan
    MOV AH,1;Nhap mot ki tu
    INT 21h;Thuc hien nhap
    MOV BL,AL;Gan ki tu vao BL
    
    MOV CL,0;Khoi tao bo dem bang 0
    MOV AH,2;Xuat
    
    MOV DL,0AH;Xuong dong
    INT 21h;Thuc hien xuong dong
    
    MOV DL,BL;Gan DL bang BL
WHILE_:
    INT 21h;In ki tu duoc nhap
    INC CL;Tang bien dem
    CMP CL,80;So sanh
    JB WHILE_;Neu dem be hon 80 tiep tuc lap
    
    MOV AH,4CH
    INT 21h

MAIN ENDP
END MAIN