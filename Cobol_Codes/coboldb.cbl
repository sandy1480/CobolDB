       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLDB.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY COBnnn.
       PROCEDURE DIVISION.
       LA-MAIN SECTION.
       LA-10.
           DISPLAY 'Starting COBOLDB' END-DISPLAY.
           MOVE 1 TO TSRnnPRIND.
           MOVE 0 TO TSRnnRSIND.
           MOVE 5 TO TSRnnSERNO.
           MOVE 2 TO TSRnnSUBSER.
       LA-20.
           CALL 'STRnn'
                USING BY REFERENCE TSRnnPRMS,
                      BY REFERENCE TRFSERVICE,
                      BY REFERENCE TRFSUBSER
           END-CALL.
           DISPLAY ':::::: SERVICE TABLE DATA ::::::'.
           DISPLAY 'TRFSRNO    :  ' TRFSRNO.
           DISPLAY 'TRFSRTYPE  :  ' TRFSRTYPE.
           DISPLAY 'TRFSRNAME  :  ' TRFSRNAME.
           DISPLAY 'TRFSRVETGP :  ' TRFSRVETGP.
           DISPLAY 'TRFSRACTGP :  ' TRFSRACTGP.
           DISPLAY 'TRFSRSEG   :  ' TRFSRSEG.
           DISPLAY 'TRFSRSECT  :  ' TRFSRSECT.
           DISPLAY 'TRFSRPSN   :  ' TRFSRPSN.
           DISPLAY 'TRFSRSAI   :  ' TRFSRSAI.
           DISPLAY 'TRFSRFTA   :  ' TRFSRFTA.
           DISPLAY 'TRFSRCCA   :  ' TRFSRCCA.
           DISPLAY 'TRFSRCT    :  ' TRFSRCT.
           DISPLAY 'TRFSRAPA   :  ' TRFSRAPA.
           DISPLAY 'TRFSRDCA   :  ' TRFSRDCA.
           DISPLAY 'TRFSRATA   :  ' TRFSRATA.

           DISPLAY 'RSIND:' TSRnnRSIND END-DISPLAY.
           DISPLAY 'Returned value=' RETURN-CODE END-DISPLAY.
       LA-EXIT.
           STOP RUN.
