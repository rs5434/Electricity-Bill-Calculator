.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 13,10,'===== ELECTRICITY BILL CALCULATOR =====$'
MSG2 DB 13,10,'Enter units consumed: $'
MSG3 DB 13,10,'Electricity Bill = Rs. $'

UNITS DW ?
BILL DW ?

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display title
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Display input message
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Read number
    CALL READ_NUMBER
    MOV UNITS, AX

    ; -------------------------
    ; Check electricity units
    ; -------------------------

    CMP AX, 100
    JBE LOW

    CMP AX, 200
    JBE MEDIUM

    JMP HIGH


; =========================
; 0 - 100 UNITS
; =========================

LOW:

    MOV AX, UNITS

    ; Bill = Units * 2
    ADD AX, AX

    MOV BILL, AX
    JMP DISPLAY


; =========================
; 101 - 200 UNITS
; =========================

MEDIUM:

    ; First 100 units = 100 * 2 = 200
    MOV AX, 200

    ; Remaining units
    MOV BX, UNITS
    SUB BX, 100

    ; Remaining * 3
    MOV DX, BX
    ADD BX, BX
    ADD BX, DX

    ; Total bill
    ADD AX, BX

    MOV BILL, AX
    JMP DISPLAY


; =========================
; ABOVE 200 UNITS
; =========================

HIGH:

    ; First 100 units = 200
    MOV AX, 200

    ; Next 100 units = 300
    ADD AX, 300

    ; Remaining units
    MOV BX, UNITS
    SUB BX, 200

    ; Remaining * 5
    MOV DX, BX
    ADD BX, BX
    ADD BX, BX
    ADD BX, DX

    ; Total bill
    ADD AX, BX

    MOV BILL, AX


; =========================
; DISPLAY BILL
; =========================

DISPLAY:

    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

    MOV AX, BILL

    CALL PRINT_NUMBER

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP


; =================================
; READ NUMBER FROM KEYBOARD
; =================================

READ_NUMBER PROC

    MOV BX, 0

READ_LOOP:

    MOV AH, 01H
    INT 21H

    ; Check ENTER key
    CMP AL, 13
    JE READ_DONE

    ; Convert ASCII to number
    SUB AL, '0'

    MOV AH, 0

    ; Save digit
    MOV DX, AX

    ; Previous number * 10
    MOV AX, BX
    MOV BX, 10
    MUL BX

    ; Add new digit
    ADD AX, DX

    MOV BX, AX

    JMP READ_LOOP

READ_DONE:

    MOV AX, BX

    RET

READ_NUMBER ENDP


; =================================
; PRINT NUMBER
; =================================

PRINT_NUMBER PROC

    MOV CX, 0
    MOV BX, 10

DIVIDE:

    MOV DX, 0
    DIV BX

    PUSH DX
    INC CX

    CMP AX, 0
    JNE DIVIDE

PRINT:

    POP DX

    ADD DL, '0'

    MOV AH, 02H
    INT 21H

    LOOP PRINT

    RET

PRINT_NUMBER ENDP

END MAIN