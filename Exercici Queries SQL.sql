
		--Ej.1) Quantitat de registres de la taula de vols:

		SELECT count(`flight_ID`) as total 
		FROM `flights`;
		
		--Ej. 2) Retard promig de sortida i arribada segons l’aeroport origen.
		
		SELECT `Origin`, AVG (`ArrDelay`) as prom_arribades, AVG(`DepDelay`) as prom_sortides 
		FROM `flights` 
		GROUP BY `Origin`;
		

		--Ej. 3) Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):
		
		SELECT `Origin`, `colYear`, `colMonth`, AVG (`ArrDelay`) AS prom_arribades
		FROM `flights` 
		GROUP BY `Origin`, `colYear`, `colMonth` 
		ORDER BY `Origin`, `colYear`, `colMonth` ASC;
		

		--Ej. 4) Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
		 
		 SELECT `City`, `colYear`, `colMonth`, AVG (`ArrDelay`) AS prom_arribades
		 FROM `flights`  
		 LEFT JOIN `usairports`
		 ON (`flights`.`Origin`=`usairports`.`IATA`)
		 GROUP BY `City`, `colYear`, `colMonth` 
		 ORDER BY `City`, `colYear`, `colMonth` ASC;


		
		--Ej. 5) Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.

		SELECT `UniqueCarrier`, `colYear`, `colMonth`,
        SUM(`Cancelled`) as `total_cancelled`
		FROM `flights` 
		WHERE `Cancelled` > 0
		GROUP BY `UniqueCarrier`, `colYear`, `colMonth` 
		ORDER BY `total_cancelled` ASC;
		

		--Ej. 6) L’identificador dels 10 avions que més distància han recorregut fent vols.
		
		SELECT `TailNum`, SUM(`Distance`) AS `totalDistance` 
		FROM `flights` 
		WHERE `TailNum` <> '' 
		GROUP BY `TailNum` 
		ORDER BY SUM(`Distance`) DESC LIMIT 10;
		

		--Ej. 7: Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts.
		
		SELECT `UniqueCarrier`, AVG(`ArrDelay`) AS `avgDelay` 
		FROM `flights` 
		GROUP BY `UniqueCarrier`
		HAVING AVG(`ArrDelay`) > 10
		ORDER BY `avgDelay` DESC;

