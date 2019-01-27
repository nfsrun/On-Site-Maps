-- Muhammad Hariz

-- tables
-- Table: tblCoordinate
CREATE TABLE tblCoordinate (
    coordinateID int  NOT NULL IDENTITY,
    objectID int  NOT NULL,
    long decimal(12,9)  NULL,
    lat decimal(12,9)  NULL,
    CONSTRAINT tblCoordinate_pk PRIMARY KEY  (coordinateID)
);

-- Table: tblLocationType
CREATE TABLE tblLocationType (
    locationTypeID int  NOT NULL IDENTITY,
    locationTypeName varchar(40)  NULL,
    locationTypeDesc varchar(100)  NOT NULL,
    CONSTRAINT tblLocationType_pk PRIMARY KEY  (locationTypeID)
);

-- Table: tblObject
CREATE TABLE tblObject (
    objectID int  NOT NULL IDENTITY,
    objectTypeID int  NOT NULL,
    locationTypeID int  NOT NULL,
    CONSTRAINT tblObject_pk PRIMARY KEY  (objectID)
);

-- Table: tblObjectType
CREATE TABLE tblObjectType (
    objectTypeID int  NOT NULL IDENTITY,
    objectTypeName varchar(20)  NOT NULL,
    CONSTRAINT tblObjectType_pk PRIMARY KEY  (objectTypeID)
);

-- foreign keys
-- Reference: tblCoordinate_tblObject (table: tblCoordinate)
ALTER TABLE tblCoordinate ADD CONSTRAINT tblCoordinate_tblObject
    FOREIGN KEY (objectID)
    REFERENCES tblObject (objectID);

-- Reference: tblObject_tblLocationType (table: tblObject)
ALTER TABLE tblObject ADD CONSTRAINT tblObject_tblLocationType
    FOREIGN KEY (locationTypeID)
    REFERENCES tblLocationType (locationTypeID);

-- Reference: tblObject_tblObjectType (table: tblObject)
ALTER TABLE tblObject ADD CONSTRAINT tblObject_tblObjectType
    FOREIGN KEY (objectTypeID)
    REFERENCES tblObjectType (objectTypeID);



-- insert procedure (object type)
insert into tblObjectType values('Point')
insert into tblObjectType values('Line')
insert into tblObjectType values('Polygon')


-- insert procedure (location type)
insert into tblLocationType values('accounting', 'Description 1')
insert into tblLocationType values('airport', 'Description 2')
insert into tblLocationType values('amusement park', 'Description 3')
insert into tblLocationType values('aquarium', 'Description 4')
insert into tblLocationType values('art gallery', 'Description 5')
insert into tblLocationType values('atm', 'Description 6')
insert into tblLocationType values('bakery', 'Description 7')
insert into tblLocationType values('bank', 'Description 8')
insert into tblLocationType values('bar', 'Description 9')
insert into tblLocationType values('beauty salon', 'Description 10')
insert into tblLocationType values('bicycle store', 'Description 11')
insert into tblLocationType values('book store', 'Description 12')
insert into tblLocationType values('bowling alley', 'Description 13')
insert into tblLocationType values('bus station', 'Description 14')
insert into tblLocationType values('cafe', 'Description 15')
insert into tblLocationType values('campground', 'Description 16')
insert into tblLocationType values('car dealer', 'Description 17')
insert into tblLocationType values('car rental', 'Description 18')
insert into tblLocationType values('car repair', 'Description 19')
insert into tblLocationType values('car wash', 'Description 20')
insert into tblLocationType values('casino', 'Description 21')
insert into tblLocationType values('cemetery', 'Description 22')
insert into tblLocationType values('church', 'Description 23')
insert into tblLocationType values('city hall', 'Description 24')
insert into tblLocationType values('clothing store', 'Description 25')
insert into tblLocationType values('convenience store', 'Description 26')
insert into tblLocationType values('courthouse', 'Description 27')
insert into tblLocationType values('dentist', 'Description 28')
insert into tblLocationType values('department store', 'Description 29')
insert into tblLocationType values('doctor', 'Description 30')
insert into tblLocationType values('electrician', 'Description 31')
insert into tblLocationType values('electronics store', 'Description 32')
insert into tblLocationType values('embassy', 'Description 33')
insert into tblLocationType values('fire station', 'Description 34')
insert into tblLocationType values('florist', 'Description 35')
insert into tblLocationType values('funeral home', 'Description 36')
insert into tblLocationType values('furniture store', 'Description 37')
insert into tblLocationType values('gas station', 'Description 38')
insert into tblLocationType values('gym', 'Description 39')
insert into tblLocationType values('hair_care', 'Description 40')
insert into tblLocationType values('hardware store', 'Description 41')
insert into tblLocationType values('hindu temple', 'Description 42')
insert into tblLocationType values('home goods store', 'Description 43')
insert into tblLocationType values('hospital', 'Description 44')
insert into tblLocationType values('insurance agency', 'Description 45')
insert into tblLocationType values('jewelry store', 'Description 46')
insert into tblLocationType values('laundry', 'Description 47')
insert into tblLocationType values('lawyer', 'Description 48')
insert into tblLocationType values('library', 'Description 49')
insert into tblLocationType values('liquor store', 'Description 50')
insert into tblLocationType values('local government_office', 'Description 51')
insert into tblLocationType values('locksmith', 'Description 52')
insert into tblLocationType values('lodging', 'Description 53')
insert into tblLocationType values('meal delivery', 'Description 54')
insert into tblLocationType values('meal takeaway', 'Description 55')
insert into tblLocationType values('mosque', 'Description 56')
insert into tblLocationType values('movie rental', 'Description 57')
insert into tblLocationType values('movie theater', 'Description 58')
insert into tblLocationType values('moving company', 'Description 59')
insert into tblLocationType values('museum', 'Description 60')
insert into tblLocationType values('night club', 'Description 61')
insert into tblLocationType values('painter', 'Description 62')
insert into tblLocationType values('park', 'Description 63')
insert into tblLocationType values('parking', 'Description 64')
insert into tblLocationType values('pet store', 'Description 65')
insert into tblLocationType values('pharmacy', 'Description 66')
insert into tblLocationType values('physiotherapist', 'Description 67')
insert into tblLocationType values('plumber', 'Description 68')
insert into tblLocationType values('police', 'Description 69')
insert into tblLocationType values('post office', 'Description 70')
insert into tblLocationType values('real estate agency', 'Description 71')
insert into tblLocationType values('restaurant', 'Description 72')
insert into tblLocationType values('roofing contractor', 'Description 73')
insert into tblLocationType values('rv park', 'Description 74')
insert into tblLocationType values('school', 'Description 75')
insert into tblLocationType values('shoe store', 'Description 76')
insert into tblLocationType values('shopping mall', 'Description 77')
insert into tblLocationType values('spa', 'Description 78')
insert into tblLocationType values('stadium', 'Description 79')
insert into tblLocationType values('storage', 'Description 80')
insert into tblLocationType values('store', 'Description 81')
insert into tblLocationType values('subway station', 'Description 82')
insert into tblLocationType values('supermarket', 'Description 83')
insert into tblLocationType values('synagogue', 'Description 84')
insert into tblLocationType values('taxi stand', 'Description 85')
insert into tblLocationType values('train station', 'Description 86')
insert into tblLocationType values('transit station', 'Description 87')
insert into tblLocationType values('travel agency', 'Description 88')
insert into tblLocationType values('veterinary care', 'Description 89')
insert into tblLocationType values('zoo', 'Description 90')



