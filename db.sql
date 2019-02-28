sqlite> .open C://ontime-2017-2018.db
sqlite> .schema
CREATE TABLE ontime(
    Year INT,
    Quarter INT,
    Month INT,
    DayOfMonth INT,
    DayOfWeek INT,
    FlightDate DATE,
    Reporting_Airline VARCHAR(5),
    DOT_ID_Reporting_Airline INT,
    IATA_CODE_Reporting_Airline VARCHAR(5),
    Tail_Number VARCHAR(20),
    Flight_Number_Reporting_Airline VARCHAR(20),
    OriginAirportId INT,
    OriginAirportSeqId INT,
    OriginCityMarketId INT,
    Origin VARCHAR(3),
    OriginCityName VARCHAR(250),
    OriginStateAbr VARCHAR(2),
    OriginStateFips VARCHAR(30),
    OriginStateNm VARCHAR(250),
    OriginWac INT,
    DestAirportId INT,
    DestAirportSeqId INT,
    DestCityMarketId INT,
    Dest VARCHAR(3),
    DestCityName VARCHAR(250),
    DestStateAbr VARCHAR(2),
    DestStateFips VARCHAR(10),
    DestStateNm VARCHAR(250),
    DestWac INT,
    CrsDepTime VARCHAR(4),
    DepTime VARCHAR(4),
    DepDelay INT,
    DepDelayMinutes REAL,
    DepDel15 REAL,
    DepDelayGroup REAL,
    DepTimeBlk VARCHAR(50),
    TaxiOut REAL,
    WheelsOff VARCHAR(4),
    WheelsOn VARCHAR(4),
    TaxiIn REAL,
    CrsArrTime VARCHAR(4),
    ArrTime VARCHAR(4),
    ArrDelay REAL,
    ArrDelayMinutes REAL,
    ArrDel15 REAL,
    ArrDelayGroup INT,
    ArrTimeBlk VARCHAR(50),
    Cancelled REAL,
    CancellationCode VARCHAR(250),
    Diverted REAL,
    CrsElapsedTime REAL,
    ActualElapsedTime REAL,
    AirTime REAL,
    Flights REAL,
    Distance REAL,
    DistanceGroup INT,
    CarrierDelay REAL,
    WeatherDelay REAL,
    NasDelay REAL,
    SecurityDelay REAL,
    LateAircraftDelay REAL,
    FirstDepTime VARCHAR(250),
    TotalAddGtime REAL,
    LongestAddGtime REAL,
    DivAirportLandings INT,
    DivReachedDest REAL,
    DivActualElapsedTime REAL,
    DivArrDelay REAL,
    DivDistance REAL,
    Div1Airport VARCHAR(3),
    Div1AirportId INT,
    Div1AirportSeqId INT,
    Div1WheelsOn VARCHAR(4),
    Div1TotalGtime REAL,
    Div1LongestGtime REAL,
    Div1WheelsOff VARCHAR(4),
    Div1TailNum VARCHAR(20),
    Div2Airport VARCHAR(3),
    Div2AirportId INT,
    Div2AirportSeqId INT,
    Div2WheelsOn VARCHAR(4),
    Div2TotalGtime REAL,
    Div2LongestGtime REAL,
    Div2WheelsOff VARCHAR(4),
    Div2TailNum VARCHAR(20),
    Div3Airport VARCHAR(3),
    Div3AirportId INT,
    Div3AirportSeqId INT,
    Div3WheelsOn VARCHAR(4),
    Div3TotalGtime REAL,
    Div3LongestGtime REAL,
    Div3WheelsOff VARCHAR(4),
    Div3TailNum VARCHAR(20),
    Div4Airport VARCHAR(3),
    Div4AirportId INT,
    Div4AirportSeqId INT,
    Div4WheelsOn VARCHAR(4),
    Div4TotalGtime REAL,
    Div4LongestGtime REAL,
    Div4WheelsOff VARCHAR(4),
    Div4TailNum VARCHAR(20),
    Div5Airport VARCHAR(3),
    Div5AirportId INT,
    Div5AirportSeqId INT,
    Div5WheelsOn VARCHAR(4),
    Div5TotalGtime REAL,
    Div5LongestGtime REAL,
    Div5WheelsOff VARCHAR(4),
    Div5TailNum VARCHAR(20)
);
CREATE INDEX year on ontime(year);
CREATE INDEX date on ontime(year, month, dayofmonth);
CREATE INDEX origin ON ontime(origin);
CREATE TABLE airline_id(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE airport(
    Code VARCHAR(10),
    Description VARCHAR(255)
);
CREATE TABLE airport_id(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE airport_seq_id(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE cancellation(
    Code VARCHAR(10),
    Description VARCHAR(255)
);
CREATE TABLE carrier_history(
    Code VARCHAR(10),
    Description VARCHAR(255)
);
CREATE TABLE city_market_id(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE deparrblk(
    Code VARCHAR(10),
    Description VARCHAR(255)
);
CREATE TABLE distance_group_250(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE diversions(
    Code REAL PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE months(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE ontime_delay_groups(
    Code REAL PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE quarters(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE state_abr_aviation(
    Code VARCHAR(10),
    Description VARCHAR(255)
);
CREATE TABLE state_fips(
    Code VARCHAR(10),
    Description VARCHAR(255)
);
CREATE TABLE unique_carriers(
    Code VARCHAR(100),
    Description VARCHAR(255)
);
CREATE TABLE weekdays(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE world_area_codes(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE TABLE yesno_resp(
    Code INT PRIMARY KEY,
    Description VARCHAR(255)
);
CREATE INDEX dest ON ontime(dest);
CREATE INDEX Reporting_Airline ON ontime(Reporting_Airline);
CREATE INDEX DOT_ID_Reporting_Airline ON ontime(DOT_ID_Reporting_Airline);
CREATE INDEX IATA_CODE_Reporting_Airline ON ontime(IATA_CODE_Reporting_Airline);
CREATE INDEX Flight_Number_Reporting_Airline ON ontime(Flight_Number_Reporting_Airline);
CREATE INDEX OriginAirportId ON ontime(OriginAirportId);
CREATE INDEX DestAirportId ON ontime(DestAirportId);
sqlite>