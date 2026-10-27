 IDENTIFICATION DIVISION. 
       PROGRAM-ID. LEDGER. 
 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 BALANCE-AMT PIC 9(9)V99. 
       01 N PIC 9(6). 
       01 I PIC 9(6). 
       01 TRANS-ID PIC X(20). 
       01 TRANS-TYPE PIC X. 
       01 AMOUNT PIC S9(9)V99. 
       01 DISPLAY-BALANCE PIC Z(8)9.99. 
 
       PROCEDURE DIVISION. 
           ACCEPT BALANCE-AMT 
           ACCEPT N 
 
           PERFORM VARYING I FROM 1 BY 1 
               UNTIL I > N 
               ACCEPT TRANS-ID 
               ACCEPT TRANS-TYPE 
               ACCEPT AMOUNT 
 
               IF AMOUNT < 0 
                   DISPLAY TRANS-ID " REJECTED" 
               ELSE 
                   IF TRANS-TYPE = 'C' 
                       ADD AMOUNT TO BALANCE-AMT 
                       DISPLAY TRANS-ID " POSTED" 
                   ELSE 
                       IF TRANS-TYPE = 'D' 
                           IF AMOUNT > BALANCE-AMT 
                               DISPLAY TRANS-ID " REJECTED" 
                           ELSE 
                               SUBTRACT AMOUNT 
                                   FROM BALANCE-AMT 
                               DISPLAY TRANS-ID " POSTED" 
                           END-IF 
                       ELSE 
                           DISPLAY TRANS-ID " REJECTED" 
                       END-IF 
                   END-IF 
               END-IF 
           END-PERFORM 
           MOVE BALANCE-AMT TO DISPLAY-BALANCE 
           DISPLAY "Final balance: " DISPLAY-BALANCE 
           STOP RUN.