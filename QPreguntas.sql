
--Pregunta No.1:
SELECT airline_id.Code, airline_id.Description, count(ontime.Flights)/1000 AS Vuelos
FROM ontime
    INNER JOIN airline_id ON ontime.DOT_ID_Reporting_Airline = airline_id.Code
GROUP BY airline_id.Code
ORDER BY Vuelos DESC


--Pregunta No.2:
SELECT airline_id.Code , airline_id.Description , SUM(ontime.Cancelled) as Cancelados
FROM ontime
    INNER JOIN airline_id  ON ontime.DOT_ID_Reporting_Airline = airline_id.Code
GROUP BY airline_id.Code
ORDER BY Cancelados ASC;


SELECT airline_id.Code , airline_id.Description , SUM(ontime.Cancelled)/sum(ontime.Flights) as PorcentajeCancelados
FROM ontime
    INNER JOIN airline_id  ON ontime.DOT_ID_Reporting_Airline = airline_id.Code
GROUP BY airline_id.Code
ORDER BY PorcentajeCancelados ASC;

--Pregunta No.3:

SELECT airline_id.Code , airline_id.Description, (security + carrier + nas + aircraft) as Retraso
FROM (
    SELECT DOT_ID_Reporting_Airline as idC,  AVG(SecurityDelay) as security,
        AVG(CarrierDelay) as carrier, AVG(NasDelay) as nas,
        AVG(LateAircraftDelay) as aircraft
    FROM ontime
    GROUP BY DOT_ID_Reporting_Airline
    )
INNER JOIN airline_id  ON idC = airline_id.Code
ORDER BY Retraso ASC;

--Pregunta No.4:

SELECT airline_id.Code , airline_id.Description, (departure + arrival) as Retraso
FROM (
    SELECT DOT_ID_Reporting_Airline as idC,  AVG(DepDelay) as departure,
        AVG(ArrDelay) as arrival
    FROM ontime
    GROUP BY DOT_ID_Reporting_Airline
    )
INNER JOIN airline_id  ON idC = airline_id.Code
ORDER BY Retraso ASC;

--Pregunta No.5:

SELECT airline_id.Code , airline_id.Description , (puntuales/vuelosT) as PorcentajePuntuales
FROM ( SELECT DOT_ID_Reporting_Airline as idC,  SUM(Flights) as puntuales
    FROM ontime
    WHERE ArrDelay<1
    GROUP BY DOT_ID_Reporting_Airline
    ORDER BY DOT_ID_Reporting_Airline ASC
    )
    INNER JOIN airline_id  ON idC = airline_id.Code
    INNER JOIN (SELECT DOT_ID_Reporting_Airline as idAir, count(Flights) as vuelosT
                    FROM ontime
                    group by DOT_ID_Reporting_Airline
                    ORDER BY DOT_ID_Reporting_Airline ASC) vTotales on vTotales.idAir = airline_id.Code
GROUP BY airline_id.Code
ORDER BY PorcentajePuntuales DESC;

--Pregunta No.6:

SELECT airline_id.Description, COUNT(idCompa) as CantidadVisitados
FROM(SELECT DISTINCT DOT_ID_Reporting_Airline AS idCompa, airport_id.Code as idAir
        FROM ontime
        INNER JOIN airport_id ON airport_id.Code=ontime.OriginAirportId)
INNER JOIN airline_id ON idCompa = airline_id.Code
GROUP BY idCompa
ORDER BY CantidadVisitados DESC;

--Pregunta No.7:

SELECT airline_id.Code , airline_id.Description , SUM(ontime.Diverted)/sum(ontime.Flights) as PorcentajeDesviados
FROM ontime
    INNER JOIN airline_id  ON ontime.DOT_ID_Reporting_Airline = airline_id.Code
GROUP BY airline_id.Code
ORDER BY PorcentajeDesviados DESC;

--Pregunta No.8:

SELECT airline_id.Code, airline_id.Description, CAST(Promedio_Distancia AS INTEGER) AS Distancia
FROM
    (SELECT ontime.DOT_ID_Reporting_Airline as idAero, sum(ontime.Distance)/1000000 as Promedio_Distancia
    FROM ontime
    LEFT JOIN months ON ontime.Month = months.Code
    WHERE months.Description = 'January' OR months.Description = 'February' OR months.Description = 'July'
    OR months.Description = 'August' OR months.Description = 'December'
    GROUP BY ontime.DOT_ID_Reporting_Airline)
LEFT JOIN airline_id ON idAero = airline_id.Code
ORDER BY Distancia DESC;
