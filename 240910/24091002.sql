--테이블 생성

CREATE TABLE AIR (
    AIRLINE VARCHAR2(50) CHECK(AIRLINE IN ('JINAIR','JEJUAIR','EASTARJET','AIRBUSAN','TWAYAIR')) NOT NULL,
    FLIGHT VARCHAR2(20) NOT NULL PRIMARY KEY,
    FLIGHT_DATE DATE NOT NULL,
    COUNTRY VARCHAR2(50) CHECK (COUNTRY IN ('ASIA','EUROPE','NORTH_AMERICA','SOUTH_AFRICA','AFRICA','OCEANIA')) NOT NULL,
    TAKEOFF_TIME VARCHAR2(6) CHECK (REGEXP_LIKE(TAKEOFF_TIME, '^[0-2][0-9]:[0-5][0-9]$') OR TAKEOFF_TIME IS NULL),
    LANDING_TIME VARCHAR2(6) CHECK (REGEXP_LIKE(LANDING_TIME, '^[0-2][0-9]:[0-5][0-9]$') OR LANDING_TIME IS NULL),
    CHECK ((TAKEOFF_TIME IS NOT NULL AND LANDING_TIME IS NULL) OR 
           (TAKEOFF_TIME IS NULL AND LANDING_TIME IS NOT NULL)),
    DURING_TIME VARCHAR2(6) CHECK (REGEXP_LIKE(DURING_TIME, '^[0-2][0-9]:[0-5][0-9]$')) NOT NULL,
    SEAT_GRADE VARCHAR2(50) CHECK (SEAT_GRADE IN ('ECONOMY','BUSINESS','FIRST')) NOT NULL,
    BAGGAGE VARCHAR2(10) CHECK (BAGGAGE IN('YES','NO')) NOT NULL,
    FLIGHT_FEE NUMBER(10) NOT NULL
);

DROP TABLE AIR;

desc air;

select *
from air;

--JINAIR
insert into air values ('JINAIR','LJ9101','2024-09-10','ASIA','06:45','','02:30','ECONOMY','NO','60000');
insert into air values ('JINAIR','LJ9102','2024-09-10','ASIA','09:45','','02:30','ECONOMY','NO','60000' );
insert into air values ('JINAIR','LJ9103','2024-09-10','ASIA','13:40','','02:30','BUSINESS','NO', '195000');
insert into air values ('JINAIR','LJ9104','2024-09-10','ASIA','14:45','','02:30','FIRST','NO', '277100');
insert into air values ('JINAIR','LJ9105','2024-09-10','ASIA','','13:00','02:30','ECONOMY','YES', '60000');
insert into air values ('JINAIR','LJ9106','2024-09-10','ASIA','','13:40','02:30','ECONOMY','YES', '60000');
insert into air values ('JINAIR','LJ9107','2024-09-10','ASIA','','19:40','02:30','BUSINESS','YES', '195000');
insert into air values ('JINAIR','LJ9108','2024-09-10','ASIA','','20:55','02:30','FIRST','YES', '277100');

insert into air values ('JINAIR','LJ9111','2024-09-11','ASIA','06:45','','02:30','ECONOMY','NO', '60000');
insert into air values ('JINAIR','LJ9112','2024-09-11','ASIA','09:45','','02:30','ECONOMY','NO', '60000');
insert into air values ('JINAIR','LJ9113','2024-09-11','ASIA','13:40','','02:30','BUSINESS','NO', '195000');
insert into air values ('JINAIR','LJ9114','2024-09-11','ASIA','14:45','','02:30','FIRST','NO', '277100');
insert into air values ('JINAIR','LJ9115','2024-09-11','ASIA','','13:00','02:30','ECONOMY','YES', '60000');
insert into air values ('JINAIR','LJ9116','2024-09-11','ASIA','','13:40','02:30','ECONOMY','YES', '60000');
insert into air values ('JINAIR','LJ9117','2024-09-11','ASIA','','19:40','02:30','BUSINESS','YES', '195000');
insert into air values ('JINAIR','LJ9118','2024-09-11','ASIA','','20:55','02:30','FIRST','YES', '277100');
commit;

--JEJUAIR
insert into air values ('JEJUAIR','7C9101','2024-09-10','ASIA','08:30','','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9102','2024-09-10','ASIA','10:35','','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9103','2024-09-10','ASIA','13:20','','02:50','BUSINESS','YES', '255000');
insert into air values ('JEJUAIR','7C9104','2024-09-10','ASIA','15:05','','02:50','FIRST','YES', '334900');
insert into air values ('JEJUAIR','7C9105','2024-09-10','ASIA','','14:30','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9106','2024-09-10','ASIA','','16:35','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9107','2024-09-10','ASIA','','20:00','02:50','BUSINESS','YES', '255000');
insert into air values ('JEJUAIR','7C9108','2024-09-10','ASIA','','21:10','02:50','FIRST','YES', '334900');

insert into air values ('JEJUAIR','7C9111','2024-09-11','ASIA','08:30','','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9112','2024-09-11','ASIA','10:35','','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9113','2024-09-11','ASIA','13:20','','02:50','BUSINESS','YES', '255000');
insert into air values ('JEJUAIR','7C9114','2024-09-11','ASIA','15:05','','02:50','FIRST','YES', '334900');
insert into air values ('JEJUAIR','7C9115','2024-09-11','ASIA','','14:30','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9116','2024-09-11','ASIA','','16:35','02:50','ECONOMY','YES', '55000');
insert into air values ('JEJUAIR','7C9117','2024-09-11','ASIA','','20:00','02:50','BUSINESS','YES','255000');
insert into air values ('JEJUAIR','7C9118','2024-09-11','ASIA','','21:10','02:50','FIRST','YES', '334900');
commit;

--EASTARJET
insert into air values ('EASTARJET','ZE9101','2024-09-10','ASIA','07:05','','02:10','ECONOMY','NO', '45000');
insert into air values ('EASTARJET','ZE9102','2024-09-10','ASIA','08:00','','02:10','BUSINESS','NO', '130000');
insert into air values ('EASTARJET','ZE9103','2024-09-10','ASIA','15:10','','02:10','FIRST','NO', '245000');
insert into air values ('EASTARJET','ZE9104','2024-09-10','ASIA','','13:35','02:10','ECONOMY','NO', '45000');
insert into air values ('EASTARJET','ZE9105','2024-09-10','ASIA','','14:35','02:10','BUSINESS','NO', '130000');
insert into air values ('EASTARJET','ZE9106','2024-09-10','ASIA','','21:15','02:10','FIRST','NO', '245000');

insert into air values ('EASTARJET','ZE9111','2024-09-11','ASIA','07:05','','02:10','ECONOMY','NO', '45000');
insert into air values ('EASTARJET','ZE9112','2024-09-11','ASIA','08:00','','02:10','BUSINESS','NO', '130000');
insert into air values ('EASTARJET','ZE9113','2024-09-11','ASIA','15:10','','02:10','FIRST','NO', '245000');
insert into air values ('EASTARJET','ZE9114','2024-09-11','ASIA','','13:35','02:10','ECONOMY','NO', '45000');
insert into air values ('EASTARJET','ZE9115','2024-09-11','ASIA','','14:35','02:10','BUSINESS','NO', '130000');
insert into air values ('EASTARJET','ZE9116','2024-09-11','ASIA','','21:15','02:10','FIRST','NO', '245000');
commit;

--AIRBUSAN
insert into air values ('AIRBUSAN','BX9101','2024-09-10','ASIA','07:35','','02:50','ECONOMY','YES', '30000');
insert into air values ('AIRBUSAN','BX9102','2024-09-10','ASIA','15:50','','02:50','FIRST','YES', '225000');
insert into air values ('AIRBUSAN','BX9103','2024-09-10','ASIA','','14:05','02:50','BUSINESS','YES', '70000');
insert into air values ('AIRBUSAN','BX9104','2024-09-10','ASIA','','22:00','02:50','FIRST','YES', '225000');

insert into air values ('AIRBUSAN','BX9111','2024-09-11','ASIA','07:35','','02:50','ECONOMY','YES', '30000');
insert into air values ('AIRBUSAN','BX9112','2024-09-11','ASIA','15:50','','02:50','BUSINESS','YES', '70000');
insert into air values ('AIRBUSAN','BX9113','2024-09-11','ASIA','','14:05','02:50','ECONOMY','YES', '30000');
insert into air values ('AIRBUSAN','BX9114','2024-09-11','ASIA','','22:00','02:50','FIRST','YES', '225000');
commit;

--TWAYAIR
insert into air values ('TWAYAIR','TW9101','2024-09-10','ASIA','07:45','','02:30','ECONOMY','YES', '80000'); 
insert into air values ('TWAYAIR','TW9102','2024-09-10','ASIA','10:20','','02:30','BUSINESS','YES', '160000');
insert into air values ('TWAYAIR','TW9103','2024-09-10','ASIA','15:00','','02:30','FIRST','YES', '270000');
insert into air values ('TWAYAIR','TW9104','2024-09-10','ASIA','','14:05','02:30','ECONOMY','NO', '80000');
insert into air values ('TWAYAIR','TW9105','2024-09-10','ASIA','','17:50','02:30','BUSINESS','NO', '160000');
insert into air values ('TWAYAIR','TW9106','2024-09-10','ASIA','','21:10','02:30','FIRST','NO', '270000');

insert into air values ('TWAYAIR','TW9111','2024-09-11','ASIA','07:45','','02:30','ECONOMY','YES', '80000'); 
insert into air values ('TWAYAIR','TW9112','2024-09-11','ASIA','10:20','','02:30','BUSINESS','YES', '160000');
insert into air values ('TWAYAIR','TW9113','2024-09-11','ASIA','15:00','','02:30','FIRST','YES', '270000');
insert into air values ('TWAYAIR','TW9114','2024-09-11','ASIA','','14:05','02:30','ECONOMY','NO', '80000');
insert into air values ('TWAYAIR','TW9115','2024-09-11','ASIA','','17:50','02:30','BUSINESS','NO', '160000');
insert into air values ('TWAYAIR','TW9116','2024-09-11','ASIA','','21:10','02:30','FIRST','NO', '270000');
commit;


--정렬기준: 소요시간(짧은순), 출발시간(이른순), 출발시간(늦은순), 도착시간(이른순), 도착시간(늦은순)
--view1: 소요시간(짧은순)
create view air_during_time
as
