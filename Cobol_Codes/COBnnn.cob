       01  TSRnnPRMS.
           03 TSRnnPRIND     PIC 9.
           03 TSRnnRSIND     PIC 9.
           03 TSRnnSERNO     PIC 9(4).
           03 TSRnnSUBSER    PIC 9(2).

       01  TRFSERVICE.
           03 TRFSRNO        PIC 9(4) COMP-5.
           03 TRFSRTYPE      PIC 9.
           03 TRFSRNAME      PIC X(3).
           03 TRFSRVETGP     PIC 9.
           03 TRFSRACTGP     PIC 9.
           03 TRFSRSEG       PIC 9.
           03 TRFSRSECT      PIC 9.
           03 TRFSRPSN       PIC 9.
           03 TRFSRSAI       PIC 9.
           03 TRFSRFTA       PIC 9.
           03 TRFSRCCA       PIC 9.
           03 TRFSRCT        PIC 9.
           03 TRFSRAPA       PIC 9.
           03 TRFSRDCA       PIC 9.
           03 TRFSRATA       PIC 9.

       01  TRFSUBSER.
           03 TRFSBSERNO     PIC 9(4).
           03 TRFSBSBNO      PIC 9(2).
           03 TRFSBST        PIC 9.
           03 TRFSBSF        PIC 9.
           03 TRFSBIBC       PIC 9.
           03 TRFSBCFCF      PIC X.
           03 TRFSBCFCM      PIC X.
           03 TRFSBCFCT      PIC 9(3).
           03 TRFSBWCB       PIC 9.
           03 TRFSBTCB       PIC 9.
           03 TRFSBCTT       PIC 9.
           03 TRFSBCOA       PIC 9(4).
           03 TRFSBCCAF      PIC X.
           03 TRFSBCCAM      PIC 9.
           03 TRFSBTCW       PIC 9(10).
