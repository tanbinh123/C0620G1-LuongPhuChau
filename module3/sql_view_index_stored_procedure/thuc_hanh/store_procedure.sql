use classicmodels;

-- Tạo Mysql Stored Procedure :
DELIMITER //

CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM customers;

END //

DELIMITER ;

-- Gọi procedure :
call findAllCustomers();

-- Sửa procedure :
-- Trong Mysql không cung cấp lệnh sửa Stored nên thông thường chúng ta sẽ chạy lệnh tạo mới.
-- Lệnh Drop để xóa đi Procedure đó và tạo lại :
DELIMITER //

DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

   SELECT *  FROM customers where customerNumber = 175;

END //

DELIMITER ;