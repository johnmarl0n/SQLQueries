SELECT
  CTR.CODSTK,CTR.CODFAB,CTR.NOME AS Produto,STK.CODIPI AS NCM,STK.MARCA AS Marca,CTR.ESTOQUEF10 AS Estoque,CTR.CUSTOF10   AS CUSTO,
  (CTR.CUSTOF10 * CTR.ESTOQUEF10) AS TOTAL,CTR.PRCNETF10   AS CUSTO_NET,(CTR.PRCNETF10 * CTR.ESTOQUEF10) AS NET_TOTAL,
  STK.ESTOQUE         AS EstoqueAtual
  
FROM CTSTKMES CTR
  LEFT JOIN ITEMSTK STK ON (STK.CODSTK=CTR.CODSTK)
  
WHERE (CTR.SID IS NOT NULL)   AND  (CTR.ESTOQUEF10 > 0 )
  AND (CTR.ANO    = '2024')
  AND (STK.TEMMOV =    'S')
  
ORDER BY STK.CODIPI
