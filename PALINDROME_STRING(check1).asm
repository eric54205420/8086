DATA SEGMENT 
    STR DB 'MALAYALAM'
    
    MES1 DB "PALINDROME $"
    MES2 DB "NOT PLAINDROME $"
    DATA ENDS

PRINT MACRO MES
    MOV AH,09H
    LEA DX,MES
    INT 21H
    INT 3H
ENDM
    
    EXTRA SEGMENT 
        STOR DB 9 DUP(?)
        EXTRA ENDS    
CODE SEGMENT 
ASSUME CODE : CS , DATA:DS,EXTRA : ES
START:
MOV AX,DATA
MOV DS,AX

MOV AX,EXTRA
MOV ES,AX

LEA SI,STR
LEA DI,STOR+8
MOV CX,00009H

BACK:
CLD
LODSB
STD
STOSB
LOOP BACK

LEA SI,STR
LEA DI,STOR
MOV CX,0009H

CLD
REPZ CMPSB
JNZ SKIP
PRINT MES1
SKIP: PRINT MES2

INT 21H

END START
CODE ENDS