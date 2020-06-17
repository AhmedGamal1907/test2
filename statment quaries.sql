insert into Sickers values('hesan','krim',20,29)
insert into Sickers values('basem','osama',22,7)
insert into Sickers values('ahmed','ali',30,2)
insert into Sickers values('twfik','zidan',35,5)
insert into Sickers values('kalied','nader',25,6)
insert into Sickers values('mohmed','ahmed',30,7)
insert into Sickers values('ahmed','gmal',40,10)
insert into Sickers values('zedan','refat',50,11)
insert into rooms values(29,1)
insert into rooms values(7,2)
insert into rooms values(3,3)
insert into rooms values(2,4)
insert into rooms values(5,5)
insert into rooms values(6,6)
insert into rooms values(7,7)
insert into rooms values(10,8)
insert into rooms values(11,9)
insert into Medicines values(1,'A')
insert into Medicines values(2,'B')
insert into Medicines values(3,'C')
insert into Medicines values(4,'D')
insert into Medicines values(5,'X')
insert into Medicines values(6,'Z')
insert into Medicines values(7,'P')
insert into Medicines values(8,'W')
insert into salary values(1500,1)
insert into salary values(2400,2)
insert into salary values(2600,3)
insert into salary values(4700,4)
insert into salary values(6800,5)
insert into salary values(7200,6)
insert into salary values(6300,7)
insert into salary values(5100,8)

update doctors set doctor_firse_name='ahmed',doctor_last_name='alala' where doctor_id=5
update Sickers set Sicker_first_name='sied',Sicker_last_name='amar' where Sicker_id=7
update rooms set Sicker_id=15,room_id=4 where Sicker_id=3 and room_id=5
update Medicines set Medicine_nmae=13, Sicker_id=15 where Medicine_id=8
update salary set salary_value=1300 where salary_id=8

SELECT *from salary
select * from salary where salary_value>4200 and salary_value<2000
select * from salary where salary_value=1500and doctor_id= 1
select max(salary_value) as max_salary_value from salary
select sum(salary_value) as sum_salary_value from salary
select avg(salary_value) as avg_salary_value from salary
select min(salary_value) as min_salary_value from salary
select sum(salary_value)as min_salary_value from salary having sum(salary_value)>5
SELECT *from Medicines
select*from Medicines where Sicker_id between 2 and 8
select * from Medicines where Sicker_id  in(7)
select * from rooms
select * from rooms where Sicker_id in(5)
select * from rooms where Sicker_id not in(7)
select *from Sickers
select Sicker_first_name from Sickers where Sicker_last_name ='ahmed'
select Sicker_first_name from Sickers where room_id between 4 and 7
select * from Sickers where Sicker_last_name like ('%ah%')
select Sicker_first_name from Sickers where Sicker_first_name like('%a%')
select top 5 Sicker_last_name from Sickers
select  distinct  Sicker_last_name from Sickers
select top 5 Sicker_last_name from Sickers order by patient_last_name asc
select*from doctors
select doctor_firse_name  from doctors where doctor_last_name='sad'
select *from doctors where doctor_firse_name like'ahmed%'and doctor_last_name='ali%'
select *from doctors where doctor_id between 1 and 5
select doctor_id from doctors where doctor_id in (1,7)
select count(doctor_firse_name) as number_of_doctors from doctors
SELECT COUNT(doctor_id) ,doctor_firse_name FROM doctors GROUP BY doctor_firse_name
SELECT COUNT(Sicker_id), Sicker_first_name FROM Sickers GROUP BY Sicker_first_name order BY COUNT(Sicker_id) DESC
SELECT Sicker_first_name FROM Sickers  WHERE Sicker_id IN (SELECT Sicker_id FROM Sickers WHERE Sicker_id >5)
SELECT doctor_firse_name, doctor_last_name, OrderCount = (SELECT COUNT(Sicker_id) FROM Sickers  WHERE Sickers.Sicker_id=  doctors.doctor_id)FROM doctors  
SELECT Medicine_nmae FROM Medicines WHERE Sicker_id IN (SELECT Sicker_id FROM Medicines WHERE Sicker_id=5)

