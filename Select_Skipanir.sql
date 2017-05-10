3.
SELECT `Title`, `Year`, `Cost` 
FROM `movie` 
WHERE Title Like '%Hope%'
Order By Title ASC

4.
SELECT  `Title`, `Year`, `Genre` 
FROM `movie` 
WHERE Genre = 'Action'

5.
SELECT `ID`, `Title`,  `Cost` 
FROM `movie` 
WHERE Cost > 40

6.
SELECT  `ID` ,  `Title` ,  `Cost` ,  `Genre` 
FROM  `movie` 
WHERE Genre =  'ACTION'
OR Genre = 'COMEDY' 
OR Cost < 50
ORDER BY Genre ASC 
LIMIT 0 , 30

7.
SELECT `ID`, ConCat(`Title`,' ','(',`Year`,')',' ', `Genre`) AS Description
From Movie

8.
SELECT  `Genre`, Count(`Title`) AS 'Number of Movies' 
FROM `movie` 
Group By `Genre`

9.
SELECT AVG(`Cost`) AS 'Average Cost' 
FROM `movie` 

10.SELECT `Title`, `Genre`,`Year`, `Description`, `Fee`
FROM `movie` 
Join Price ON (`PriceCode` = `Code`)
Where `Genre` = 'Family'
OR `Genre` = 'Drama'
OR `Genre` = 'Comedy'
SELECT `Genre`,AVG(`Cost`) AS 'Average Cost' 
FROM `movie`
Group By `Genre`

11.
SELECT `Title`, `Genre`, `Description`, `Fee`
FROM `movie` 
Join Price ON (`PriceCode` = `Code`)

12.
SELECT `Genre`, Avg(`Fee`) AS 'Average Fee'
FROM `movie`
Inner Join Price ON (`PriceCode` = `Code`)
Group By `Genre`

13.
SELECT  `Title` ,  `Year` , (`Cost` /  `Fee`) AS  'Breakeven Rentals'
FROM  `movie` 
INNER JOIN Price ON (  `PriceCode` =  `Code` ) 
LIMIT 0 , 30

14.
SELECT  `Title` ,  `Year` 
FROM  `movie` 
WHERE  `PriceCode` >=1
LIMIT 0 , 30

15.
SELECT `Title`, `Year`, `Cost`
FROM `movie` 
WHERE Cost Between 44.99 AND 49.99

16.
SELECT `Title`,`Year`, `Description`, `Fee`
FROM `movie` 
Join Price ON (`PriceCode` = `Code`)
Where `Genre` = 'Family'
OR `Genre` = 'Drama'
OR `Genre` = 'Comedy'

17.
Select Min(`Balance`), Avg(`Balance`), Max(`Balance`)
From Members
Inner Join rental ON (`members`.`ID` = `Mem_ID`)

18.
SELECT Concat(`First Name`,' ', `Last Name`) As 'Membership Name', ConCat(`Street`,' ', `City`,' ', `State`,' ', `Zip`) AS 'Membership Address' 
FROM `members`

19.
SELECT `Rent_ID`, `Vid_ID`,  `Title`, `DueDate`, `ReturnDate`, `Rent_Date`
FROM `detailrental`
inner join rental on (`Rent_ID` = `Rental`.`ID`)
Inner Join video On (`VID_ID` = `Video`.`ID`)
Inner join movie on (`Movie_ID` = `Movie`.`ID`)
Where `ReturnDate` > `DueDate`

20.
SELECT `Rent_ID`, `Vid_ID`,  `Title`, `DueDate`, `ReturnDate`, `Rent_Date`, (`ReturnDate` - `DueDate`) As 'Days Past Due'
FROM `detailrental`
inner join rental on (`Rent_ID` = `Rental`.`ID`)
Inner Join video On (`VID_ID` = `Video`.`ID`)
Inner join movie on (`Movie_ID` = `Movie`.`ID`)
Where `ReturnDate` > `DueDate`

21.
SELECT `Rent_ID`, `Rent_Date`, `Title`, `FEE`
FROM `detailrental` 
Join rental on (`Rent_ID` = `Rental`.`ID`)
join video on (`Vid_ID` = `Video`.`ID`)
join movie on (`Movie_ID` = `Movie`.`ID`)
WHERE `ReturnDate` <= `DueDate`

22.
SELECT `Members`.`ID`, `Last Name`, `First Name`, sum(`Fee`) 
FROM `detailrental`
Inner join rental on (`Rent_ID` = `Rental`.`ID`)
Inner join members on (`Mem_ID` = `Members`.`ID`)
Group By `Members`.`ID`

23.
SELECT `ID`, `G`.`GENRE`, CAST(`AC` AS DECIMAL(10,2)) AS `AVRAGE COST` , `COST`, CAST((`COST`-`AC`)/`AC`*100 AS DECIMAL(10,2)) AS `PRECENTAGE DIFFREANCE`
FROM`MOVIE` `G`, (SELECT `GENRE`, AVG(`COST`) AS `AC` FROM`MOVIE` GROUP BY  `GENRE`) `J` 
WHERE `G`.`GENRE` = `J`.`GENRE`; 

24.
ALTER TABLE  `detailrental` ADD  `DaysLate` TINYINT( 3 ) NULL AFTER  `DailyLateFee` ;

25.
ALTER TABLE  `video` ADD  `Status` VARCHAR( 4 ) NOT NULL DEFAULT  'IN' 
Check (`Status` = 'IN' or `Status` = 'OUT' OR `Status` = 'LOST');

26.
UPDATE `Video` Set `Status`= 'OUT'
Where `ID` IN (Select `Vid_ID` From `detailrental` Where `ReturnDate` IS NULL)

27.
ALTER TABLE  `price` ADD  `RentDays` TINYINT( 2 ) NOT NULL DEFAULT  '3';

28.
UPDATE `price` SET `RentDays`= 5 WHERE `Code` In (1,3)
UPDATE `price` SET `RentDays`= 7 WHERE `Code` = 4
