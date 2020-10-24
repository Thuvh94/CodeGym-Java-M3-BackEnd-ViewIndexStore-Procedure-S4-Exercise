CREATE DATABASE SESSION4_EXERCISE1;

use session4_exercise1;

CREATE TABLE PRODUCTS(
id int(10),
productCode int (10),
productName varchar(20),
productPrice int(10),
productAmount int (10),
productDescription varchar (10),
productStatus varchar(10)
);

insert into products
values(1,101,'LG',2500000,10,'Blue','New');

insert into products
values(2,102,'LG',3500000,21,'Green','New'),
(3,103,'SamSung',7000000,2,'Purple','Second2'),
(4,104,'LG',3450000,5,'Red','old');

select*from products;

create unique index productCodeIndex on products (productCode);

create index productNamePrice on products (productName, productPrice);

explain select * from products where productCode = 101;

CREATE VIEW productView 
as SELECT productCode, productName, productPrice, productStatus
FROM products;

alter view productView
as select 
productCode, productName, productPrice, productStatus
FROM products
where productName = 'LG';

select * from productView;

drop view productView;

delimiter //
create procedure getAllProductsInfo()
begin select * from products;
end//
delimiter ;

delimiter //
create procedure addNewProduct(
IN id int, productCode int, productName varchar(10), productPrice int(10), productAmount int(10), productDescription varchar(10), productStatus varchar(10)
)
begin 
insert into products
values(id,productCode,productName,productPrice,productAmount,productDescription,productStatus);
end //
delimiter ;

call addNewProduct(5,105,'Sony',2800000,3,'White','new');

select*from products;


-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateProduct(
in inputId int (10), inputProductCode int, inputProductName varchar(10), inputProductPrice int(10), productAmount int(10), inputProductDescription varchar(10), inputProductStatus varchar(10)
)
begin 
update products
set productCode = inputProductCode, 
productName = inputProductName,
productPrice = inputProductPrice,
productAmount = inputProductAmount,
productDescription = inputProductDescription,
productStatus = inputProductStatus
where id = inputId; 
end//
delimiter ;

use session4_exercise1;
select*from products;

delimiter //
create procedure updateProduct(
in inputId int (10), inputProductCode int, inputProductName varchar(10), inputProductPrice int(10), inputProductAmount int(10), inputProductDescription varchar(10), inputProductStatus varchar(10)
)
begin 
update products
set productCode = inputProductCode, 
productName = inputProductName,
productPrice = inputProductPrice,
productAmount = inputProductAmount,
productDescription = inputProductDescription,
productStatus = inputProductStatus
where id = inputId; 
end//
delimiter ;

call updateProduct(2,111,'Oppo',2000000,2,'Like new','recommend');

alter table products
add primary key (id);

drop procedure updateProduct;

select * from products;

-- Tạo store procedure xoá sản phẩm theo id
create procedure deleteProductById(
in deletedId int(10)
)
delete from products
where id = deletedId;

call deleteProductById(3);

select * from products;









