SELECT
	R.DatEmi AS Data
	,R.NumReq
	,R.NumNot AS Nota
	,R.CodCLI + ' - '+ C.FANTASIA + CASE WHEN C.codven IS NOT null THEN ' - Ven\Cli : ' + C.CODVEN + '-' +V.Fantasia ELSE '' end  AS Cliente
	,I.CODFAB      AS CodFabrica
	,I.CODSTK      AS Codigo
	,I.Nome
	,I.Qtdade
	,I.UNIDADE     AS Un
	,I.PRCCUE      AS Custo
	,(I.prccue*I.QTDADE) AS CustoTotal
	,I.Preco
	,I.Total
	,case when(I.prccue>0) then (I.Total/(I.prccue*I.QTDADE)) else (I.prccue*0) end AS MrkUp
	,SUBSTRING(E.FICTEC,1,50) AS APLICACAO
	
FROM ITEMVDA AS I
	LEFT JOIN REQVDA AS R ON (R.SID=I.SID)
	LEFT JOIN CLIENTES AS C ON (C.CODCLI=R.CODCLI)
	LEFT JOIN CLIENTES AS V ON (V.CODCLI=C.CODVEN)
	LEFT JOIN ITEMSTK AS E ON (E.CODSTK=I.CODSTK)

WHERE(R.TIPOREQ='VD')AND(I.MOVSTK='S')
	AND(R.DATEMI >= '01-JUN-2025')
	AND(R.DATEMI <= '30-JUN-2025')

