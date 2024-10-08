SELECT
  R.DTHCAD,R.NUMREQ,R.NUMNOT,R.NUMNFS,R.DATEMI,R.DATSAI,R.CODCLI,C.NOME,c.FANTASIA,C.UF,R.CFOP,R.NFEID,R.TOTGERAL,R.TIPOREQ,R.BASEICM,
  R.TOTICM,R.BASEICMOUT,R.BASESUB,R.TOTSUB,R.BASESBT,R.TOTSBT,R.TOTRET,R.BASEIPI,R.TOTIPI,R.BASEPIS,R.TOTPIS,R.TOTCOF, CN.DTHCAD AS DTCONF,
  CN.SEQIT  AS Fiscal

FROM REQCOM AS R
  LEFT JOIN NATOPR N ON(N.CODNAT=R.CODNAT)
  LEFT JOIN CLIENTES AS C ON(C.CODCLI=R.CODCLI)
  OUTER APPLY (SELECT NXP.DTHCAD, NXP.SEQIT FROM ITEMNXP AS NXP WHERE NXP.NFEID=R.NFEID AND NXP.SEQIT='FIS') AS CN
  
WHERE(R.NUMNOT>' ' OR R.NUMNFS>' ')AND(N.ENTSAI='E')
  AND(CONVERT(DATE,R.DTHCAD)  >= '01-OCT-2024')
  AND(CONVERT(DATE,R.DTHCAD)  <= '03-OCT-2024')

UNION ALL

SELECT
  R.DTHCAD,R.NUMREQ,R.NUMNOT,R.NUMNFS,R.DATEMI,R.DATSAI,R.CODCLI,C.NOME,c.FANTASIA,C.UF,R.CFOP,R.NFEID,R.TOTGERAL,R.TIPOREQ,R.BASEICM,
  R.TOTICM,R.BASEICMOUT,R.BASESUB,R.TOTSUB,R.BASESBT,R.TOTSBT,R.TOTRET,R.BASEIPI,R.TOTIPI,R.BASEPIS,R.TOTPIS,R.TOTCOF, NULL AS DTCONF,
  NULL AS Fiscal
  
FROM REQVDA AS R
  LEFT JOIN NATOPR N ON(N.CODNAT=R.CODNAT)
  LEFT JOIN CLIENTES AS C ON(C.CODCLI=R.CODCLI)
 
WHERE(R.NUMNOT>' ' OR R.NUMNFS>' ')AND(N.ENTSAI='E')
  AND(CONVERT(DATE,R.DTHCAD)  >= '01-OCT-2024')
  AND(CONVERT(DATE,R.DTHCAD)  <= '03-OCT-2024')
  
UNION ALL

SELECT
  R.DTHCAD,R.NUMREQ,R.NUMNOT,R.NUMNFS,R.DATEMI,R.DATSAI,R.CODCLI,C.NOME,c.FANTASIA,C.UF,R.CFOP,R.NFEID,R.TOTGERAL,R.TIPOREQ,R.BASEICM,
  R.TOTICM,R.BASEICMOUT,R.BASESUB,R.TOTSUB,R.BASESBT,R.TOTSBT,R.TOTRET,R.BASEIPI,R.TOTIPI,R.BASEPIS,R.TOTPIS,R.TOTCOF, NULL AS DTCONF,NULL AS Fiscal

FROM REQNFC AS R
  LEFT JOIN NATOPR N ON(N.CODNAT=R.CODNAT)
  LEFT JOIN CLIENTES AS C ON(C.CODCLI=R.CODCLI)
  
WHERE(R.NUMNOT>' ' OR R.NUMNFS>' ')AND(N.ENTSAI='E')
  AND(CONVERT(DATE,R.DTHCAD)  >= '01-OCT-2024')
  AND(CONVERT(DATE,R.DTHCAD)  <= '03-OCT-2024')
ORDER BY DTHCAD

