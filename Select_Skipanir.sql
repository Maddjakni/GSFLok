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