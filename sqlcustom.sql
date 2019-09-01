
create TABLE customer(
    cust_ID     number  primary key,
    cust_fname  VARCHAR(20),
    cust_Lname  VARCHAR(20) UNIQUE,
    cust_address VARCHAR(30),
    cust_Email   VARCHAR(50),
    cust_phone   integer,
    dataoffirstConact DATE
);

insert into customer VALUES(93885848,'Aziz','Aldawk','cross river rd','Az@yahoo.com',6168543313,to_date('2018-20-02', 'yyyy-dd-mm'));
insert into customer VALUES(1621380098,'Jen','Gregory','','j@gmail.com',1156563875,to_date('2016-15-09', 'yyyy-dd-mm'));
insert into customer VALUES(1950726960,'Kitty','Roth','NY road','k9i3@gmail.com',956313548,to_date('2012-16-12', 'yyyy-dd-mm'));
insert into customer VALUES(1983778485,'Jeffery','Pruittw','','',44643120,to_date('2011-25-12', 'yyyy-dd-mm'));
insert into customer VALUES(241651981,'cho','Lea','','69@hotmail.com',6656312,to_date('2000-01-01', 'yyyy-dd-mm'));


create TABLE vehicle(
    Veh_ID      number PRIMARY KEY,
    make       VARCHAR(15),
    model       VARCHAR(15),
    color      VARCHAR(10),
    Engine_Size  number,
    VIN_NUM     integer  UNIQUE,
    cust_ID int REFERENCES customer
);

insert into vehicle values(1765201984,'Nissan','GT-R','Black',8,0999089,93885848);
insert into vehicle values(2009087071,'Mazda','mazda 6','White',6,89878763,93885848);
insert into vehicle values(1945466577,'Toyota','Camry','',4,327482733,1621380098);
insert into vehicle values(514790019,'Mitsubishi','lancer','',4,33342231,1950726960);
insert into vehicle values(288201344,'Mitsubishi','outlander','black',4,23234443,1983778485);
insert into vehicle values(1759875110,'Toyota','supra','red',6,99765534,1983778485);
insert into vehicle values(1528569163,'lamborghini','aventador','green',8,23456743,1983778485);
insert into vehicle values(937543602,'Koenigsegg','Trevita','black',8,23334567,241651981);
insert into vehicle values(1896280852,'Audi','R8','black',8,9988557,241651981);


create table Mechanic(
    Mechanic_ID   number  PRIMARY KEY,
    mech_fname   VARCHAR(20),
    mech_lname   VARCHAR(20) unique, 
    mech_dataofhiring date
);


insert into Mechanic values(1732371758,'Joyce','Preston',to_date('2017-03-11', 'yyyy-dd-mm'));
insert into Mechanic values(450341416,'Anabella','Wheatley',to_date('2015-07-12', 'yyyy-dd-mm'));
insert into Mechanic values(2094610631,'Danni','Parsons',to_date('2014-23-08', 'yyyy-dd-mm'));
insert into Mechanic values(1585187196,'Davey','Guy',to_date('2011-11-03', 'yyyy-dd-mm'));
insert into Mechanic values(1486701072,'Zoya','Haynes',to_date('2018-11-06', 'yyyy-dd-mm'));


create TABLE service_order(
    service_id   number PRIMARY KEY,
    current_Mileage  number,
    DESCRIPTIONser  VARCHAR(500),
    H_of_labor     INT,
    costofpart     int, 
    numberofhours  int,
    Mechanic_ID int REFERENCES Mechanic,
    Veh_ID int REFERENCES vehicle
);

insert into service_order values(1427432490,98877,'Need oil and tire change', 4,87,4,1732371758,1765201984);
insert into service_order values(21485151,4382332,'Ask customer :D', 2,12,23,450341416,1945466577);
insert into service_order values(759631044,5569343,'I dont know why my car brok :D ', 5,66,3,2094610631,288201344);
insert into service_order values(418968424,2342332,'ummm ummm maybe my tire needs to change ', 2,47,5,1585187196,1759875110);
insert into service_order values(1122793536,80000,'I have race tomorrow and i need to check everything.', 8,500,8,1486701072,937543602);



CREATE TABLE Inventory(
    Inv_ID      number  PRIMARY KEY,
    partName       VARCHAR(20),
    PartDescrip    VARCHAR(500),
    Qty_hand       INT,
    costUnit       int, 
    record_qty    int 
);

insert into Inventory values(1078026822,'Oils','This new oils for Engin and gears',4,22,399);
insert into Inventory values(885311118,'Engin','Engin and new',1,329,90);
insert into Inventory values(1215435984,'tires','New and we have different size',8,50,500);
insert into Inventory values(1725625985,'Filters','Different kinds of filters',2,20,98);
insert into Inventory values(213131231,'Others','',2,100,9999);


create TABLE Inve_serviceOrder(
    Inv_ID int REFERENCES Inventory,
    service_id int REFERENCES service_order,
    PRIMARY KEY(Inv_ID,service_id),
    Qty_partused  int,
    labor_hr      int
);

insert into Inve_serviceOrder VALUES(1078026822,1427432490,2,4);
insert into Inve_serviceOrder VALUES(885311118,21485151,7,7);
insert into Inve_serviceOrder VALUES(1725625985,418968424,4,4);
insert into Inve_serviceOrder VALUES(213131231,1122793536,4,4);
