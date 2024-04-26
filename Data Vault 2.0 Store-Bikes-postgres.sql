CREATE SCHEMA silver_raw_vault AUTHORIZATION postgres;
CREATE SCHEMA silver_business_vault AUTHORIZATION postgres;



CREATE TABLE silver_raw_vault."HUB_Products" (
  "Hash_Key_Product" varchar PRIMARY KEY,
  "Product_ID" int,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."HUB_Orders" (
  "Hash_Key_Order" varchar PRIMARY KEY,
  "Order_ID" int,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."HUB_Customers" (
  "Hash_Key_Customer" varchar PRIMARY KEY,
  "Customer_ID" varchar,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."HUB_Employee" (
  "Hash_Key_Employee" varchar PRIMARY KEY,
  "Employee_ID" int,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."HUB_Shippers" (
  "Hash_Key_Shipper" varchar PRIMARY KEY,
  "Shipper_ID" int,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."SAT_Shipper" (
  "Hash_Key_Shipper" varchar,
  "Dt_Load" timestamp,
  "Company_Name" int,
  "Phone" varchar
);

CREATE TABLE silver_raw_vault."SAT_Product" (
  "Hash_Key_Product" varchar,
  "Dt_Load" timestamp,
  "Product_Name" varchar,
  "Category_ID" int,
  "Category_Name" varchar,
  "Supplier_ID" int,
  "Supplier_Name" varchar
);

CREATE TABLE silver_raw_vault."SAT_Customer" (
  "Hash_Key_Customer" varchar,
  "Dt_Load" timestamp,
  "Customer_Name" varchar,
  "Contact_Name" varchar
);

CREATE TABLE silver_raw_vault."SAT_Customer_Address" (
  "Hash_Key_Customer" varchar,
  "Dt_Load" timestamp,
  "Address" varchar,
  "City" varchar,
  "Region" varchar
);

CREATE TABLE silver_raw_vault."SAT_Employee" (
  "Hash_Key_Employee" varchar,
  "Dt_Load" timestamp,
  "Last_Name" varchar,
  "First_Name" varchar,
  "Title_Of_Courtesy" varchar,
  "Birth_Date" date,
  "Hire_Date" date
);

CREATE TABLE silver_raw_vault."SAT_Employee_Address" (
  "Hash_Key_Employee" varchar,
  "Dt_Load" timestamp,
  "Address" varchar,
  "City" varchar,
  "Region" varchar
);


CREATE TABLE silver_raw_vault."SAT_Orders" (
  "Hash_Key_Order" varchar,
  "Dt_Load" timestamp,
  "Order_Date" Date,
  "Required_Date" Date,
  "Shipped_Date" Date
);

CREATE TABLE silver_raw_vault."SAT_Orders_Details" (
  "Hash_Key_Link_P_O" varchar,
  "Dt_Load" timestamp,
  "Unity_Price" decimal,
  "Quantity" int,
  "Discount" decimal,
);

CREATE TABLE silver_raw_vault."LINK_Products_Orders_Detail" (
  "Hash_Key_Link_P_O" varchar PRIMARY KEY,
  "Hash_Key_Orders" varchar,
  "Hash_Key_Product" varchar,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."LINK_Shipper_Orders" (
  "Hash_Key_Link_S_O" varchar PRIMARY KEY,
  "Hash_Key_Orders" varchar,
  "Hash_Key_Shipper" varchar,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."LINK_Employee_Orders" (
  "Hash_Key_Link_E_O" varchar PRIMARY KEY,
  "Hash_Key_Orders" varchar,
  "Hash_Key_Employee" varchar,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_raw_vault."LINK_Customers_Orders" (
  "Hash_Key_Link_C_O" varchar PRIMARY KEY,
  "Hash_Key_Orders" varchar,
  "Hash_Key_Customer" varchar,
  "Dt_Load" timestamp,
  "Source" varchar
);

CREATE TABLE silver_business_vault."PIT_Customers" (
  "Hash_Key_Customer" varchar,
  "PIT_Dt_Load" timestamp,
  "Name_Dt_Load" timestamp,
  "Adress_Dt_Load" timestamp
);

CREATE TABLE silver_business_vault."PIT_Employee" (
  "Hash_Key_Employee" varchar,
  "PIT_Dt_Load" timestamp,
  "Name_Dt_Load" timestamp,
  "Adress_Dt_Load" timestamp
);

CREATE TABLE silver_business_vault."Bridge_Store" (
  "Hash_Key_Bridge" varchar,
  "Bridge_Dt_Load" timestamp,
  "Hash_Key_Orders" varchar,
  "Order_ID" int,
  "Hash_Key_Employee" varchar,
  "Employee_ID" int,
  "Hash_Key_Customer" varchar,
  "Customer_ID" varchar,
  "Hash_Key_Product" varchar,
  "Product_ID" int,
  "Hash_Key_Shipper" varchar,
  "Shipper_ID" int,
  "Hash_Key_Link_Products_Orders_Detail" varchar,
  "Hash_Key_Link_Shipper_Orders" varchar,
  "Hash_Key_Link_Employee_Orders" varchar,
  "Hash_Key_Link_Customers_Orders" varchar
);

ALTER TABLE silver_raw_vault."SAT_Shipper" ADD FOREIGN KEY ("Hash_Key_Shipper") REFERENCES silver_raw_vault."HUB_Shippers" ("Hash_Key_Shipper");

alter table silver_raw_vault."SAT_Shipper" add PRIMARY KEY("Hash_Key_Shipper", "Dt_Load")

ALTER TABLE silver_raw_vault."SAT_Product" ADD FOREIGN KEY ("Hash_Key_Product") REFERENCES silver_raw_vault."HUB_Products" ("Hash_Key_Product");

alter table silver_raw_vault."SAT_Product" add PRIMARY KEY("Hash_Key_Product", "Dt_Load")

ALTER TABLE silver_raw_vault."SAT_Customer" ADD FOREIGN KEY ("Hash_Key_Customer") REFERENCES silver_raw_vault."HUB_Customers" ("Hash_Key_Customer");

alter table silver_raw_vault."SAT_Customer" add PRIMARY KEY("Hash_Key_Customer", "Dt_Load")

ALTER TABLE silver_raw_vault."SAT_Customer_Address" ADD FOREIGN KEY ("Hash_Key_Customer") REFERENCES silver_raw_vault."HUB_Customers" ("Hash_Key_Customer");

alter table silver_raw_vault."SAT_Customer_Address" add PRIMARY KEY("Hash_Key_Customer", "Dt_Load")

ALTER TABLE silver_raw_vault."SAT_Employee" ADD FOREIGN KEY ("Hash_Key_Employee") REFERENCES silver_raw_vault."HUB_Employee" ("Hash_Key_Employee");

alter table silver_raw_vault."SAT_Employee" add PRIMARY KEY("Hash_Key_Employee", "Dt_Load")

ALTER TABLE silver_raw_vault."SAT_Employee_Address" ADD FOREIGN KEY ("Hash_Key_Employee") REFERENCES silver_raw_vault."HUB_Employee" ("Hash_Key_Employee");

alter table silver_raw_vault."SAT_Employee_Address" add PRIMARY KEY("Hash_Key_Employee", "Dt_Load")

ALTER TABLE silver_raw_vault."SAT_Orders" ADD FOREIGN KEY ("Hash_Key_Order") REFERENCES silver_raw_vault."HUB_Orders" ("Hash_Key_Order");

alter table silver_raw_vault."SAT_Orders" add PRIMARY KEY("Hash_Key_Order", "Dt_Load")


ALTER TABLE silver_raw_vault."LINK_Products_Orders_Detail" ADD FOREIGN KEY ("Hash_Key_Orders") REFERENCES silver_raw_vault."HUB_Orders" ("Hash_Key_Order");

ALTER TABLE silver_raw_vault."LINK_Products_Orders_Detail" ADD FOREIGN KEY ("Hash_Key_Product") REFERENCES silver_raw_vault."HUB_Products" ("Hash_Key_Product");

ALTER TABLE silver_raw_vault."LINK_Shipper_Orders" ADD FOREIGN KEY ("Hash_Key_Orders") REFERENCES silver_raw_vault."HUB_Orders" ("Hash_Key_Order");

ALTER TABLE silver_raw_vault."LINK_Shipper_Orders" ADD FOREIGN KEY ("Hash_Key_Shipper") REFERENCES silver_raw_vault."HUB_Shippers" ("Hash_Key_Shipper");

ALTER TABLE silver_raw_vault."LINK_Employee_Orders" ADD FOREIGN KEY ("Hash_Key_Orders") REFERENCES silver_raw_vault."HUB_Orders" ("Hash_Key_Order");

ALTER TABLE silver_raw_vault."LINK_Employee_Orders" ADD FOREIGN KEY ("Hash_Key_Employee") REFERENCES silver_raw_vault."HUB_Employee" ("Hash_Key_Employee");

ALTER TABLE silver_raw_vault."LINK_Customers_Orders" ADD FOREIGN KEY ("Hash_Key_Orders") REFERENCES silver_raw_vault."LINK_Products_Orders_Detail" ("Hash_Key_Order");

ALTER TABLE silver_raw_vault."LINK_Customers_Orders" ADD FOREIGN KEY ("Hash_Key_Customer") REFERENCES silver_raw_vault."HUB_Customers" ("Hash_Key_Customer");

ALTER TABLE silver_raw_vault."SAT_Orders_Details" ADD FOREIGN KEY ("Hash_Key_Link_P_O") REFERENCES silver_raw_vault."HUB_Orders" ("Hash_Key_Link_P_O");

ALTER TABLE silver_business_vault."PIT_Customers" ADD FOREIGN KEY ("Hash_Key_Customer") REFERENCES silver_raw_vault."HUB_Customers" ("Hash_Key_Customer");

ALTER TABLE silver_business_vault."PIT_Employee" ADD FOREIGN KEY ("Hash_Key_Employee") REFERENCES silver_raw_vault."HUB_Employee" ("Hash_Key_Employee");

ALTER TABLE silver_business_vault."Bridge_Store" ADD PRIMARY key ("Hash_Key_Bridge","Bridge_Dt_Load")

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Orders") REFERENCES "SAT_Orders" ("Hash_Key_Order");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Employee") REFERENCES "SAT_Employee" ("Hash_Key_Employee");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Customer") REFERENCES "SAT_Customer" ("Hash_Key_Customer");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Product") REFERENCES "SAT_Product" ("Hash_Key_Product");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Shipper") REFERENCES "HUB_Shippers" ("Hash_Key_Shipper");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Link_Products_Orders_Detail") REFERENCES "LINK_Products_Orders_Detail" ("Hash_Key_Link_P_O");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Link_Shipper_Orders") REFERENCES "LINK_Shipper_Orders" ("Hash_Key_Link_S_O");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Link_Employee_Orders") REFERENCES "LINK_Employee_Orders" ("Hash_Key_Link_E_O");

ALTER TABLE silver_business_vault."Bridge_Store" ADD FOREIGN KEY ("Hash_Key_Link_Customers_Orders") REFERENCES "LINK_Customers_Orders" ("Hash_Key_Link_C_O");
