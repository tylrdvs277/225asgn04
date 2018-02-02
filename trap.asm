            .ORIG       x3300

            ST          R1, StoreR1
            ST          R2, StoreR2
            ST          R3, StoreR3
            ST          R4, StoreR4



            ADD         R1, R0, #0
Start       LDI         R2, KBSR
            BRzp        Start
            LDI         R3, KBDR
            ADD         R4, R3, #-10
            BRz         Done
            STR         R3, R1, #0
            ADD         R1, R1, #1
Output      LDI         R2, DSR
            BRzp        Output
            STI         R3, DDR
            BRnzp       Start

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
