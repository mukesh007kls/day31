create database address_Book;
use address_Book;
create table contact(
id int unsigned auto_increment,
firstName varchar(25) not null,
lastName varChar(25),
phoneNumber long not null,
emailId varchar(50) not null,
address varchar(250) not null,
city varChar(50) not null,
state varchar(50) not null,
pinCode long not null,
primary key(id)
);
drop table contact;
insert into contact values(
	('Mukesh','Mallikanti',95005199297,'mallikanti2000','spk','bcm','ts',507128),
	('venkat','ma',9700,'malllikanti9','spk','bcm','ts',507128),
	('krish','m',85220,'mk','moosa','hyd','ts',500003)
    );
    drop table contact;

insert into contact(firstName,lastName,phoneNumber,emailId,address,city,state,pinCode) 
values('Mukesh','Mallikanti',95005199297,'mallikanti2000','spk','bcm','ts',507128);
insert into contact(firstName,lastName,phoneNumber,emailId,address,city,state,pinCode) 
values('venkat','ma',9700,'malllikanti9','spk','bcm','ts',507128);
insert into contact(firstName,lastName,phoneNumber,emailId,address,city,state,pinCode) 
values('krish','m',85220,'mk','moosa','hyd','ts',500003);
insert into contact(firstName,lastName,phoneNumber,emailId,address,city,state,pinCode) 
values('manoj','ka',97056,'masdf','spk','hyd','ts',507128);
insert into contact(firstName,lastName,phoneNumber,emailId,address,city,state,pinCode) 
values('mani','lll',9700,'malllikanti9','hyd','bcm','ts',507128);


select*from contact;

update contact 
set city='hyd',address='kothapet'
where firstName='mani';

update contact
set state='ap'
where id=4 or id=5;

select*from contact where city='hyd' or state='ap';

select count(city)
from contact;

select city,state,
 sum(case when city='hyd' then 1 else 0 end) cityCount,
 sum(case when state='ts' then 1 else 0 end) stateCount
 from contact group by id;
 
 select*from contact order by firstName;
 
 select firstName,lastName,city from contact where city='bcm' order by firstName;
  
alter table contact 
add bookName varchar(100) not null after id,
add contactType varchar(100) after bookname; 

select*from contact;
 
 update contact
 set bookName='personal' ,contactType='Family'
 where id=2 or id=3;
 
 update contact
 set bookName='private',contactType='friends'
 where id=1 or id=4 or id=5;

select *from contact where contactType='friends';

create table book(
id int primary key auto_increment,
bookName varchar(100)
);

create table contactType(
id int,
contactType varchar(100),
foreign key(id) references book(id)
);

alter table contactType
add contactId int auto_increment primary key after id;

alter table contactType
rename column contactId to contactTypeID;

create table contactDetails(
id int,
firstName varchar(150) not null,
lastName varchar(150),
phoneNumber double,
emailId varchar(150),
address varchar(250),
city varchar(100),
state varchar(100) default 'telangana',
pincode double,
foreign key(id) references contactType(contactTypeId)
);
drop table contactDetails;
insert into book(bookName) values
('personal'),
('private');

insert into contactType(id,contactType) 
values
(1,'family'),
(1,'friends'),
(2,'family'),
(2,'friends');

alter table contactDetails
rename column lasstName to lastname;

insert into contactDetails(id,firstName,lastName,phoneNumber,emailId,address,city,state,pincode) values
(1,'mukesh','msa',45896333,'mkls@','spk','hyd','ts',500124),
(1,'krishna','kls',48975632,'mukhjjs','bcm','kothagudem','telangana',4852);

insert into contactDetails(id,firstName,lastName,phoneNumber,emailId,address,city,state,pincode) values
(2,'mukesh','mmk',45896333,'mkls@','spk','hyd','ts',500124),
(2,'rahul','kls',48975632,'mukhjjs','bcm','kothagudem','telangana',4852);

insert into contactDetails(id,firstName,lastName,phoneNumber,emailId,address,city,state,pincode) values
(3,'manoj','mkls',45896333,'mkls@','spk','hyd','ts',500124),
(4,'manikanth','kls',48975632,'mukhjjs','bcm','kothagudem','telangana',4852);

insert into contactDetails(id,firstName,lastName,phoneNumber,emailId,address,city,state,pincode) values
(4,'manoj','mkls',45896333,'mkls@','spk','hyd','ts',500124);

select*from book;
select*from contactType;
select*from contactDetails;

select b.id,b.bookName,c.contactType,d.firstName,d.Lastname,d.phoneNumber,d.emailId,d.address,d.city,d.state,d.pincode
from book b
join contactType c on b.id=c.id
join contactDetails d on d.id=c.contactTypeId;
