                .ORIG       x3000

Quiz            AND         R3, R3, #0
                ADD         R4, R3, #3
                LEA         R1, Q1
                LEA         R2, Q1Point

NextQ           ST          R1, StoreR1
                LDR         R1, R1, #0
                JSR         GetChar
                LDR         R1, R2, #0
                JSR         GetPoints
                LD          R1, StoreR1
                ADD         R3, R3, R0
                ADD         R1, R1, #1
                ADD         R2, R2, #1
                ADD         R4, R4, #-1
                BRnp        NextQ
                LEA         R0, Result1
                LEA         R1, Range1
                JSR         OutputMsg
                BRnzp       Quiz

StoreR1         .FILL       0
Q1              .FILL       x3300
Q2              .FILL       x3378
Q3              .FILL       x33B8
Q1Point         .FILL       x3421
Q2Point         .FILL       x3425
Q3Point         .FILL       x3429
Range1          .FILL       x342D
Range2          .FILL       x342E
Range3          .FILL       x342F
Range4          .FILL       x3430
Result1         .FILL       x3431
Result2         .FILL       x3448
Result3         .FILL       x3463
Result4         .FILL       x3482

GetChar         ADD         R0, R1, #0
                ST          R7, StoreR7
                PUTS
                GETC
                OUT
                ST          R5, StoreR5
                LD          R5, ASCIIConvert         
                ADD         R0, R0, R5
                LD          R5, StoreR5
                LD          R7, StoreR7
                RET

StoreR5         .FILL       0
StoreR7         .FILL       0
ASCIIConvert    .FILL       #-48

GetPoints       ADD         R1, R1, #1
                ADD         R0, R0, #-1
                BRnp        GetPoints
                LDR         R0, R1, #-1
                RET

OutputMsg       ST          R2, StoreR2
NextRange       LDR         R2, R1, #0
                LDR         R2, R2, #0
                ADD         R1, R1, #1
                ADD         R0, R0, #1
                NOT         R2, R2
                ADD         R2, R2, #1
                ADD         R2, R3, R2
                BRp         NextRange
                LDR         R0, R0, #-1
                ST          R7, StoreR7
                PUTS
                LD          R2, StoreR2
                LD          R7, StoreR7
                RET

StoreR2         .FILL       0
                
                .END
