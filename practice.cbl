       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKING.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 BALANCE PIC 9(6) VALUE 5000.
       01 AMOUNT  PIC 9(6).
       01 CHOICE  PIC 9.

       PROCEDURE DIVISION.
           DISPLAY "1. DEPOSIT"
           DISPLAY "2. WITHDRAW"
           DISPLAY "ENTER YOUR CHOICE:"
           ACCEPT CHOICE

           DISPLAY "ENTER AMOUNT:"
           ACCEPT AMOUNT

           IF CHOICE = 1
               ADD AMOUNT TO BALANCE
               DISPLAY "AMOUNT DEPOSITED"
           ELSE
               IF CHOICE = 2
                   IF AMOUNT <= BALANCE
                       SUBTRACT AMOUNT FROM BALANCE
                       DISPLAY "AMOUNT WITHDRAWN"
                   ELSE
                       DISPLAY "INSUFFICIENT BALANCE"
                   END-IF
               ELSE
                   DISPLAY "INVALID CHOICE"
               END-IF
           END-IF

           DISPLAY "CURRENT BALANCE: " BALANCE
           STOP RUN.
