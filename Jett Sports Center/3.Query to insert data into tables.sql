--GROUP MEMBER : BRANDON CHAI-2501999261, MATTHEW JUSUF-2501998946, STEPHAN TJUARSA-2501994185

CREATE TABLE customer (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL,
 email varchar(255) NOT NULL,
  phone varchar(20) NOT NULL,
  dob date NOT NULL,
  gender varchar(255) NOT NULL,
  address text NOT NULL
) 


INSERT INTO customer (id, name, email, phone, dob, gender, address) VALUES
('CU001', 'customer1', 'customer@gmail.com', '+623542345', '2022-06-14', 'Perempuan', 'customercustomercustomercustomercustomercustomercustomer'),
('CU002', 'customer2', 'customer2@yahoo.com', '+624523432', '2022-06-01', 'Laki-Laki', 'customercustomer'),
('CU003', 'customer3', 'customer3@gmail.com', '+6253452324', '2022-06-01', 'Perempuan', 'customercustomercustomer'),
('CU004', 'customer4', 'customer4@yahoo.com', '+62985234532', '2022-06-01', 'Laki-Laki', 'customercustomercustomercustomer'),
('CU005', 'customer5', 'customer5@gmail.com', '+6253423', '2022-06-30', 'Perempuan', 'customercustomercustomercustomercustomer'),
('CU006', 'customer6', 'customer6@yahoo.com', '+628943523', '2022-06-01', 'Laki-Laki', 'customercustomercustomercustomercustomercustomer'),
('CU007', 'customer7', 'customer7@gmail.com', '+62546234532', '2022-06-16', 'Perempuan', 'customercustomercustomercustomercustomercustomercustomer'),
('CU008', 'customer8', 'customer8@yahoo.com', '+6254523', '2022-06-27', 'Laki-Laki', 'customercustomercustomercustomercustomercustomercustomercustomer'),
('CU009', 'customer9', 'customer9@gmail.com', '+625342354', '2022-06-22', 'Perempuan', 'customercustomercustomercustomercustomercustomercustomercustomercustomer'),
('CU010', 'customer10', 'customer10@yahoo.com', '+62534523', '2022-06-12', 'Laki-Laki', 'customercustomercustomercustomercustomercustomercustomercustomercustomercustomer');




CREATE TABLE product (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  weight int(11) NOT NULL,
 price int(11) NOT NULL,
  categoryid varchar(5) NOT NULL
) 


INSERT INTO product (id, name, description, weight, price) VALUES
('PR001', 'Keyboard1', 'test', 3, 23000),
('PR002', 'Chair2', 'Chair1Chair2', 3, 45000),
('PR003', 'Mouse3', 'mouse1mpuse2', 5, 10000),
('PR004', 'Table4', 'Table1Table4', 5, 30000),
('PR005', 'Headphone', 'fjaksldnfas', 9, 10),
('PR006', 'Speaker6', 'Speaker5Speaker6', 5, 5000000),
('PR007', 'Moinitor7', 'Monitor1Monitor8', 3, 1000),
('PR008', 'Laptop8', 'Laptop1Laptop2', 8, 1000000),
('PR009', 'Computer9', 'Computer8Computer9', 7, 89000000),
('PR010', 'Accessories10', 'fnkfasldf', 9, 90000);


CREATE TABLE producttransaction (
  id varchar(5) NOT NULL,
  staffid varchar(5) NOT NULL,
  costumerid varchar(5) NOT NULL,
  date date NOT NULL,
  productid varchar(5) NOT NULL,
  quantity int(11) NOT NULL
) 



CREATE TABLE staff (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  dob date NOT NULL,
  gender varchar(255) NOT NULL,
  address text NOT NULL,
  salary int(11) NOT NULL
) 



INSERT INTO staff (id, name, email, phone, dob, gender, address, salary) VALUES
('ST001', 'staff1', 'staff1@gmail.com', '+62532452', '2022-06-08', 'Laki-Laki', 'staff1', 453425324),
('ST002', 'staff2', 'staff@yahoo.com', '+625234532', '2022-06-04', 'Perempuan', 'staffstaff', 3245234),
('ST003', 'V3', 'staff3@gmail.com', '+62534523423', '2022-06-04', 'Laki-Laki', 'staffstaffstaff', 345324),
('ST004', 'staff4', 'staff4@yahoo.com', '+6243252', '2022-06-02', 'Perempuan', 'staffstaffstaffstaff', 83249532),
('ST005', 'staff5', 'staff5@gmail.com', '+6234523', '2022-06-01', 'Laki-Laki', 'staffstaffstaffstaffstaff', 100000000),
('ST006', 'staff6', 'staff6@yahoo.com', '+62534523', '2022-06-11', 'Perempuan', 'staffstaffstaffstaffstaffstaff', 8904325),
('ST007', 'staff7', 'staff7@gmail.com', '+6285394523', '2022-06-09', 'Laki-Laki', 'staffstaffstaffstaffstaffstaffstaff', 53453),
('ST008', 'staff8', 'staff8@yahoo.com', '+62435435432', '2022-06-08', 'Perempuan', 'staffstaffstaffstaffstaffstaffstaffstaff', 352345324),
('ST009', 'staff9', 'staff9@gmail.com', '+625435324', '2022-06-01', 'Laki-Laki', 'staffstaffstaffstaffstaffstaffstaffstaffstaffstaff', 4345234),
('ST010', 'staff10', 'staff10@yahoo.com', '+6243254324', '2022-06-01', 'Perempuan', 'staffstaffstaffstaffstaffstaffstaffstaffstaffstaffstaff', 40939523);


ALTER TABLE customer
  ADD PRIMARY KEY (id);


ALTER TABLE product
  ADD PRIMARY KEY (id),
  ADD KEY categoryid (categoryid);


ALTER TABLE producttransaction
  ADD PRIMARY KEY (id),
  ADD KEY costumerid (costumerid),
  ADD KEY productid (productid);


ALTER TABLE staff
  ADD PRIMARY KEY (id);


ALTER TABLE product
  ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (categoryid) REFERENCES category (id);


ALTER TABLE producttransaction
  ADD CONSTRAINT producttransaction_ibfk_1 FOREIGN KEY (costumerid) REFERENCES customer (id),
  ADD CONSTRAINT producttransaction_ibfk_2 FOREIGN KEY (productid) REFERENCES product (id);
COMMIT;

