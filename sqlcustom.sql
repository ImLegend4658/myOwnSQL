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




create table Mechanic(
    Mechanic_ID   number  PRIMARY KEY,
    mech_fname   VARCHAR(20),
    mech_lname   VARCHAR(20) unique, 
    mech_dataofhiring date
);


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


CREATE TABLE Inventory(
    Inv_ID      number  PRIMARY KEY,
    partName       VARCHAR(20),
    PartDescrip    VARCHAR(500),
    Qty_hand       INT,
    costUnit       int, 
    record_qty    int 
);

create TABLE Inve_serviceOrder(
    Inv_ID int REFERENCES Inventory,
    service_id int REFERENCES service_order,
    PRIMARY KEY(Inv_ID,service_id),
    Qty_partused  int,
    labor_hr      int
);
