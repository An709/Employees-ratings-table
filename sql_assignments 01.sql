Q1: Write a query to find the doctors having more ratings than their supervisors.

Employees ratings table
| Employee Id |Employee Name |rating |supervisor employee Id |designation
| 1 |Dr. Max | 9 | 3 |doctor
| 2 |Dr. James | 8 | 4 |doctor
| 3 | Peter | 6 | NULL |supervisor
| 4 | Simon | 9 | NULL |supervisor

For the above table, Dr.Max has more rating than his supervisor.


create table Employees_ratings(
Employee_Id integer primary key,
Employee_Name varchar(30) not null,
rating integer not null,
Supervisor_Employee_Id integer,
designation varchar(20) not null
);
insert into Employees_ratings values(1,"Dr.Max",9,3,'doctor');
insert into Employees_ratings values(2,"Dr.James",8,4,'doctor');
insert into Employees_ratings(Employee_Id,Employee_Name,rating,designation) values(3,"Peter",6,'supervisor');
insert into Employees_ratings(Employee_Id,Employee_Name,rating,designation) values(4,"Simon",9,'supervisor');

select Employee_Name from Employees_ratings where designation = 'doctor' and rating >= (select(max(rating)) from Employees_ratings where designation = 'supervisor');