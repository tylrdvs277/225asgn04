; Name: Tyler Davis
;
; 1) The KSBR interrupt is not enable (bit[14] set to 0)
;
; 2) Trap Out (polling) 1:  Stores away R1
;                       2:  Loads the DSR into R1
;                       3:  Loops again if bit[15] isn't set
;                       4:  Puts the character in DDR
;                       5:  Loads back R1
;                       6:  Returns
;       

            .ORIG       x3300
;
; Stores all the registers needed for the trap
;
            ST          R1, StoreR1
            ST          R2, StoreR2
            ST          R3, StoreR3
            ST          R4, StoreR4

            ADD         R1, R0, #0
;
; Polls the keyboard status register
;
Start       LDI         R2, KBSR
            BRzp        Start
            LDI         R3, KBDR
            ADD         R4, R3, #-10
            BRz         Done
            STR         R3, R1, #0
            ADD         R1, R1, #1
;
; Polls the device status register
; Only outputs if character is not
; x000A (LF)
;
Output      LDI         R2, DSR
            BRzp        Output
            STI         R3, DDR
            BRnzp       Start
;
; Restores all the registers
;
Done        STR         R4, R1, #0
            LD          R1, StoreR1
            LD          R2, StoreR2
            LD          R3, StoreR3
            LD          R4, StoreR4

            RET

KBSR        .FILL       xFE00
KBDR        .FILL       xFE02       
DSR         .FILL       xFE04
DDR         .FILL       xFE06
StoreR1     .FILL       0
StoreR2     .FILL       0
StoreR3     .FILL       0
StoreR4     .FILL       0

            .END
