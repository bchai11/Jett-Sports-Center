--GROUP MEMBER : BRANDON CHAI-2501999261, MATTHEW JUSUF-2501998946, STEPHAN TJUARSA-2501994185


--
-- Table structure for table `category`
--

CREATE TABLE category (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL
) 

-- --------------------------------------------------------

-- --------------------------------------------------------



--
-- Table structure for table `customer`
--

CREATE TABLE customer (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  phone varchar(20) NOT NULL,
  dob date NOT NULL,
  gender varchar(255) NOT NULL,
  address text NOT NULL
) 

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE product (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  weight int NOT NULL,
  price int NOT NULL,
  categoryid varchar(5) NOT NULL
) 

-- --------------------------------------------------------

--
-- Table structure for table `producttransaction`
--

CREATE TABLE producttransaction (
  id varchar(5) NOT NULL,
  staffid varchar(5) NOT NULL,
 costumerid varchar(5) NOT NULL,
  date date NOT NULL,
  productid varchar(5) NOT NULL,
  quantity int NOT NULL
) 

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE staff (
  id varchar(5) NOT NULL,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
 phone varchar(255) NOT NULL,
 dob text NOT NULL,
  gender varchar(255) NOT NULL,
  address text NOT NULL,
  salary int NOT NULL
) 

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--



--
-- Indexes for table `category`
--
ALTER TABLE category
  ADD PRIMARY KEY (id);





--
-- Indexes for table `customer`
--
ALTER TABLE customer
  ADD PRIMARY KEY (id);

--
-- Indexes for table `product`
--
ALTER TABLE product
  ADD PRIMARY KEY (id),
  FOREIGN KEY (productid) REFERENCES product (productid);

--
-- Indexes for table `producttransaction`
--
ALTER TABLE producttransaction
  ADD PRIMARY KEY (id),
  FOREIGN KEY (costumerid) REFERENCES MsCustomer (customerid),
  FOREIGN KEY (productid) REFERENCES MsProduct (productid);

--
-- Indexes for table `staff`
--
ALTER TABLE staff
  ADD PRIMARY KEY (id);



--
-- Constraints for dumped tables
--



--
-- Constraints for table `product`
--
ALTER TABLE product
  ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (categoryid) REFERENCES category (id);

--
-- Constraints for table `producttransaction`
--
ALTER TABLE producttransaction
  ADD CONSTRAINT producttransaction_ibfk_1 FOREIGN KEY (costumerid) REFERENCES customer (id);
COMMIT;

  ALTER TABLE producttransaction
    ADD CONSTRAINT producttransaction_ibfk_2 FOREIGN KEY (productid) REFERENCES product (id);
COMMIT;