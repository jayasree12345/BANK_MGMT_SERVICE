
-- create
CREATE TABLE bank (
bank_code INT PRIMARY KEY,
bank_name NVARCHAR(50) NOT NULL,
address NVARCHAR(50) NOT NULL,
);

CREATE TABLE branch (
branch_id INT IDENTITY(1,1) PRIMARY KEY,
branch_name VARCHAR(100) UNIQUE,
address VARCHAR(50) NOT NULL,
bank_code INT,
FOREIGN KEY (bank_code)
REFERENCES bank (bank_code) ON DELETE CASCADE
);

CREATE TABLE customer (
customer_id INT IDENTITY(1,1) PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
phone_number NVARCHAR(50) NOT NULL,
address NVARCHAR(50) NOT NULL,
);

CREATE TABLE account (
account_number NVARCHAR(20) PRIMARY KEY,
account_type  NVARCHAR(50) NOT NULL,
balance  NVARCHAR(50) NOT NULL,
branch_id INT,
FOREIGN KEY (branch_id)
REFERENCES Branch (branch_id) ON UPDATE CASCADE
);


CREATE TABLE loan (
loan_id INT IDENTITY(1,1) PRIMARY KEY,
loan_type NCHAR(2) CHECK (loan_type='PL' or loan_type='HL'),
amount NVARCHAR(50) NOT NULL,
branch_id INT,
FOREIGN KEY (branch_id)
REFERENCES branch (branch_id)
);


-- insert

INSERT INTO bank (bank_code,bank_name,address) VALUES
(23458901 , 'hdfc' , '2/4 banglore'),
(76548733 , 'axis', '6/9 hyd'),
(98765420 , 'sbi' , '5/6 chennai');

INSERT INTO branch (branch_name,address,bank_code) VALUES
('Agali' , '4/7 Anantapur' ,23458901),
('Madhudi', '2/5 Madakasira' ,76548733),
('Nosam' , '3/9 Kurnool' ,98765420);

INSERT INTO customer (name,phone_number,address) VALUES
('jaya',8500163010 , 'delhi'),
('chinni',8907652012,'banglore'),
('jyothi',7411559852 , 'chittor');

INSERT INTO account (account_number,account_type,balance) VALUES
('5017864534' , 'salaryaccount' , 200),
('6754095231','savingaccount' ,400),
('8907643209' , 'savingaccount' , 500);

INSERT INTO loan (loan_type, amount,branch_id) VALUES
('PL', '4000000',1),
('HL', '3000000',2),
('HL', '5000000',3);
-- fetch 
SELECT *FROM bank;
SELECT *FROM branch;
SELECT *FROM customer;
SELECT *FROM account;
SELECT *FROM loan;
