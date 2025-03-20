       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-SCREEN.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       SOURCE-COMPUTER. IBM-ATX.
       OBJECT-COMPUTER. IBM-ATX.
       SPECIAL-NAMES.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
           01 WS-ACTIVE-SPACES VALUE SPACES.

           05 WS-PROGRAM-NAME      PIC X(50) VALUE 'MAIN.COB'.
           05 WS-PROGRAM-PID       PIC 9(5).
           05 WS-USERNAME          PIC X(50).
           05 WS-UNKOWN            PIC X(7) VALUE 'UNKNOWN'.                           
           05 WS-ENV-USERNAME      PIC X(8) VALUE 'USER'.
           05 WS-ENV-VALUE         POINTER.
           05 WS-DASHLINE          PIC X(80) VALUE SPACES.

           05 WS-ACTION            PIC X(1).
        
           
           05 WS-COMPANY-NAME      PIC X(40).
           05 WS-LAST-NAME         PIC X(40).
           05 WS-FIRST-NAME        PIC X(40).
           05 WS-ADDRESS-1         PIC X(40).
           05 WS-ADDRESS-2         PIC X(40).
           05 WS-ADDRESS-3         PIC X(40).
           05 WS-ZIP               PIC X(10).
           05 WS-CITY              PIC X(40).
           05 WS-STATE             PIC X(2).
           05 WS-COUNTRY           PIC X(30).
           05 WS-EMAIL             PIC X(120).
           05 WS-PHONE             PIC X(15).
           05 WS-PHONE-EXT         PIC X(10).
           05 WS-MOBILE            PIC X(15).

       LINKAGE SECTION.
           01 LP-ENV-VALUE         PIC X(255).

       SCREEN SECTION.

       01 CLEAR-SCREEN.
           05 BLANK SCREEN.

       01 HEADER-SCREEN.
      *>    HEADER
           05 TITLELINE    LINE 1  COLUMN 1
               VALUE "SINGULARIDEAS".
           05 MODULELINE   LINE 2  COLUMN 1
               VALUE "RESOURCES PLANNING".
           
           05 LABEL-PROGRAM-NAME  LINE 1  COLUMN 55
               VALUE "PROGRAM ..: MAIN.COB".

           05 LABEL-PROGRAMPID    LINE 2  COLUMN 55
               VALUE "PID ......:".
           05 VALUE-PROGRAM-NAME  LINE 2  COLUMN 69
               FROM WS-PROGRAM-PID.

           05 LINE 3 COLUMN 1 FROM WS-DASHLINE.

       01 FOOTER-SCREEN.
      *>    FOOTER
           05 LINE 24 COLUMN 1 FROM WS-DASHLINE.

           05 LINE 25 COLUMN 1 VALUE '<TAB> Next | <ENTER> Save/Cancel'.
           05 LINE 25 COLUMN 53 VALUE 'CUSTOMERS | Add New | v1.1.2'.

       01 DIALOG-SAVE-CANCEL-SCREEN.
      *>    DIALOG SAVE/CANCEL
           05 LINE 25 COLUMN 1 VALUE '(S)ave | (C)ancel | (E)xit =>   '.
           05 LINE 25 COLUMN 31 REVERSE-VIDEO 
               PIC X(1)
               USING WS-ACTION.

       01 DIALOG-CONTINUE-EXIT-SCREEN.
      *>    DIALOG CONTINUE/EXIT
           05 LINE 25 COLUMN 1  VALUE '(C)ontinue | (E)xit => '.
           05 LINE 25 COLUMN 24 REVERSE-VIDEO 
               PIC X(1)
               USING WS-ACTION.

       01 FOOTER-DIALOG-CLEAR.
           05 LINE 25 COLUMN 1 VALUE '                                '.

       01 INPUT-SCREEN AUTO.
      *>    INPUT FORM
           05 LABEL-COMPANY-NAME LINE 5 COLUMN 5 
               VALUE 'COMPANY .....: '.
           05 INPUT-COMPANY-NAME LINE 5 COLUMN 20 
               REVERSE-VIDEO 
               PIC X(42)
               USING WS-COMPANY-NAME.

           05 LABEL-LAST-NAME   LINE 7  COLUMN 5
               VALUE 'LAST NAME ...: '.
           05 INPUT-LAST-NAME   LINE 7  COLUMN 20
               REVERSE-VIDEO 
               PIC X(42) 
               USING WS-LAST-NAME.

           05 LABEL-FIRST-NAME  LINE 8  COLUMN 5 
               VALUE 'FIRST NAME ..: '.
           05 INPUT-FIRST-NAME  LINE 8  COLUMN 20
               REVERSE-VIDEO 
               PIC X(42)
               USING WS-FIRST-NAME.

           05 LABEL-ADDRESS-1   LINE 10  COLUMN 5 
               VALUE 'ADDRESS 1 ...: '.
           05 INPUT-ADDRESS-1   LINE 10  COLUMN 20
               REVERSE-VIDEO 
               PIC X(42)
               USING WS-ADDRESS-1.

           05 LABEL-ADDRESS-2   LINE 11  COLUMN 5 
               VALUE '        2 ...: '.
           05 INPUT-ADDRESS-2   LINE 11  COLUMN 20
               REVERSE-VIDEO 
               PIC X(42)
               USING WS-ADDRESS-2.

           05 LABEL-ADDRESS-3   LINE 12  COLUMN 5 
               VALUE '        3 ...: '.
           05 INPUT-ADDRESS-3   LINE 12  COLUMN 20
               REVERSE-VIDEO 
               PIC X(42)
               USING WS-ADDRESS-3.

           05 LABEL-ZIP         LINE 13  COLUMN 5 
               VALUE 'ZIP .........: '.
           05 INPUT-ZIP         LINE 13  COLUMN 20
               REVERSE-VIDEO 
               PIC X(10)
               USING WS-ZIP.

           05 LABEL-CITY        LINE 14  COLUMN 5 
               VALUE 'CITY ........: '.
           05 INPUT-CITY        LINE 14  COLUMN 20
               REVERSE-VIDEO 
               PIC X(30)
               USING WS-CITY.

           05 LABEL-STATE       LINE 14  COLUMN 51 
               VALUE 'STATE .: '.
           05 INPUT-STATE       LINE 14  COLUMN 60
               REVERSE-VIDEO 
               PIC X(2)
               USING WS-STATE.

           05 LABEL-COUNTRY     LINE 15  COLUMN 5 
               VALUE 'COUNTRY : '.
           05 INPUT-COUNTRY     LINE 15  COLUMN 20
               REVERSE-VIDEO 
               PIC X(30)
               USING WS-COUNTRY.

           05 LABEL-EMAIL       LINE 17  COLUMN 5 
               VALUE 'EMAIL .......: '.
           05 INPUT-EMAIL       LINE 17  COLUMN 20
               REVERSE-VIDEO 
               PIC X(42)
               USING WS-EMAIL.

           05 LABEL-PHONE       LINE 19  COLUMN 5 
               VALUE 'PHONE .......: '.
           05 INPUT-PHONE       LINE 19  COLUMN 20
               REVERSE-VIDEO 
               PIC X(15)
               USING WS-PHONE.

           05 LABEL-PHONE-EXT   LINE 19  COLUMN 38 
               VALUE 'EXT .: '.
           05 INPUT-PHONE-EXT   LINE 19  COLUMN 45
               REVERSE-VIDEO 
               PIC X(10)
               USING WS-PHONE-EXT.

           05 LABEL-MOBILE      LINE 20  COLUMN 5 
               VALUE 'MOBILE ......: '.
           05 INPUT-MOBILE      LINE 20  COLUMN 20
               REVERSE-VIDEO 
               PIC X(15)
               USING WS-MOBILE.

       PROCEDURE DIVISION.
           BEGIN.
               CALL "C$GETPID"
                   MOVE RETURN-CODE TO WS-PROGRAM-PID

               CALL "getenv" 
                   USING WS-ENV-USERNAME 
                   RETURNING WS-ENV-VALUE
               
               IF WS-ENV-VALUE = NULL THEN
                   MOVE WS-UNKOWN 
                       TO WS-USERNAME
               ELSE
                   SET ADDRESS OF LP-ENV-VALUE 
                       TO WS-ENV-VALUE 
                   MOVE LP-ENV-VALUE 
                       TO WS-USERNAME
               END-IF

               INSPECT WS-DASHLINE REPLACING ALL " " BY "-"

               PERFORM UNTIL WS-ACTION EQUAL 'E' OR WS-ACTION EQUAL 'e'
                   DISPLAY INPUT-SCREEN
                   DISPLAY CLEAR-SCREEN
                   DISPLAY HEADER-SCREEN
                   DISPLAY FOOTER-SCREEN

                   ACCEPT INPUT-SCREEN
                   
                   DISPLAY FOOTER-DIALOG-CLEAR
                   DISPLAY DIALOG-SAVE-CANCEL-SCREEN
                   ACCEPT DIALOG-SAVE-CANCEL-SCREEN

                   IF WS-ACTION EQUAL 'S' OR WS-ACTION EQUAL 's'
                       *> Save your DATA here
                       MOVE " " TO WS-ACTION
                       
                       DISPLAY FOOTER-DIALOG-CLEAR
                       DISPLAY DIALOG-CONTINUE-EXIT-SCREEN
                       ACCEPT DIALOG-CONTINUE-EXIT-SCREEN
                   END-IF

                   IF WS-ACTION EQUAL 'C' OR WS-ACTION EQUAL 'c'
                       *> Clean WORKING STORAGE variables
                       MOVE " " TO WS-ACTION
                   ELSE IF WS-ACTION EQUAL 'E' OR WS-ACTION EQUAL 'e'
                       *> EXIT
                       MOVE "E" TO WS-ACTION
                   END-IF
               END-PERFORM.
       STOP RUN.
      