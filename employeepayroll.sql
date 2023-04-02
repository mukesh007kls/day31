create database payrollservice;
use payrollservice;
create table employee_payroll(
id int primary key not null auto_increment,
employee_Name varchar(50)  not null,
salary double,
dateOFStart date
);

select*from employee_payroll;

insert into employee_payroll(employee_Name,salary,dateOFStart)
value('Mukesh',200000,'2000-01-23');
insert into employee_payroll(employee_Name,salary,dateOFStart)
value('Karthik',230000,'2005-06-01');
insert into employee_payroll(employee_Name,salary,dateOFStart)
value('manoj',400000,'2008-12-26');

insert into employee_payroll(employee_Name,salary,dateOFStart)
values
('rahul',460000,'2020-12-30'),
('manikanth',596000,'2000-12-1');

select*from employee_payroll;

select*from employee_payroll where employee_Name='Mukesh';

select*from employee_payroll 
where dateOFStart between cast('2005-01-01' as date) and date(now());

alter table employee_payroll
add gender varchar(10) after employee_Name;

update employee_payroll
set employee_Name='krishna'
where id=4;

update employee_payroll
set employee_Name='sita'
where id=5;

update employee_payroll 
set gender='male'
where id=1 or id=2 or id=3;

update employee_payroll 
set gender='female'
where employee_Name='sita' or employee_Name='krishna';

select sum(salary) from employee_payroll 
where gender='female' group by gender;

select avg(salary) from employee_payroll
where gender='male' group by gender;

select min(salary) from employee_payroll
where gender='male' group by gender;

select max(salary) from employee_payroll
where gender='male' group by gender;

select count(gender)
from employee_payroll;

alter table employee_payroll
add phoneNumber int after employee_Name,
add address varchar(250) default 'hyderabad' after phoneNumber,
add department varchar(150) not null after gender;

update employee_payroll 
set department='instru' 
where id=4 or id=1 or id=3;

update employee_payroll
set department='mech'
where id=2 or id=5;

alter table employee_payroll
add basicPay double after salary,
add deductions double after basicPay,
add taxable double after deductions,
add incomeTax double after taxable,
add netPay double after incomeTax;

select*from employee_payroll;

alter table employee_payroll
drop column basicPay,
rename column salary to basicPay;
alter table employee_payroll
rename column dateOFStart to dateOfStart;
insert into employee_payroll(employee_name,gender,department,basicPay,deductions,taxable,incomeTax,netPay,dateOfStart) values
('sita','female','hr',596000,100000,200000,150000,1000000,'2005-12-01');

create table employee(
id int auto_increment not null primary key,
employeeName varchar(150) not null,
phoneNumber double,
address varchar(250) default 'hyderabad',
gender varchar(1)
);

create table department(
id int,
departmentName varchar(50),
foreign key (id) references employee(id)
);

alter table employee
add startOfDate date not null after gender;

create table payroll(
id int,
basicPay double,
deductions double,
taxable double,
incomeTax double,
netPay double,
foreign key(id) references employee(id)
);

select e.id,e.employeeName,e.phoneNumber,e.address,e.gender,e.startOfDate,d.departmentName,p.basicPay,p.deductions,p.taxable,p.incomeTax,p.netpay
from employee e
join department d on e.id=d.id
join payroll p on e.id=p.id;

select*from employee;
select*from department;
select*from payroll;

insert into department(id,departmentName) values
(1,'mech'),
(2,'instru'),
(3,'sales'),
(3,'hr');

insert into payroll(id,basicPay,deductions,taxable,incomeTax,netPay) values
(1,400000,10000,10000,12000,600000),
(2,500000,10000,20000,12000,800000),
(3,900000,10000,10000,12000,1200000);

insert into employee(employeeName,phonenumber,gender,startOfDate) value
('rahul',9505850674,'m','2012-05-01');

select*from employee;
