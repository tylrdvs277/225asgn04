        .ORIG       x3300

Q1      .STRINGZ    "\nWhich Star Wars is your favorite?\n\t1 - The Last Jedi\n\t2 - A New Hope\n\t3 - Rogue One\n\t4 - Attack of the Clones\nAnswer: "

Q2      .STRINGZ    "\nWhat major is best?\n\t1 - CSC\n\t2 - CPE\n\t3 - SE\n\t4 - EE\nAnswer: "

Q3      .STRINGZ    "\nWhat is your favorite show?\n\t1 - The Grand Tour\n\t2 - Silicon Valley\n\t3 - The Office\n\t4 - Other\nAnswer: "

Q1Point .FILL       #0
        .FILL       #7
        .FILL       #10
        .FILL       #1
Q2Point .FILL       #10
        .FILL       #6
        .FILL       #8
        .FILL       #4
Q3Point .FILL       #10
        .FILL       #7
        .FILL       #9
        .FILL       #2

Range1  .FILL       #14
Range2  .FILL       #18
Range3  .FILL       #23
Range4  .FILL       #30

Result1 .STRINGZ    "\nYou're a lost cause.\n"
Result2 .STRINGZ    "\nYou got some work to do.\n"
Result3 .STRINGZ    "\nThere is still hope for you.\n"
Result4 .STRINGZ    "\nFinally, someone who gets it.\n"

        .END
