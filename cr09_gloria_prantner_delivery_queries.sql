SELECT mail.received_time, mail.weight, mail.fk_deposit_location_ID, deposit_location.ZIP
from mail
RIGHT JOIN deposit_location on fk_deposit_location_ID = deposit_location.deposit_ID


SELECT mail.weight, mail.fk_deposit_location_ID
from mail
WHERE weight > 6


SELECT employee.employee_ID, employee.f_name, employee.l_name,employee.gender
FROM employee
WHERE gender = 'F';


SELECT employee.employee_ID, employee.f_name, employee.l_name,employee.gender, deposit_location.deposit_ID, deposit_location.country
FROM employee
RIGHT JOIN deposit_location ON fk_working_location_ID = deposit_location.deposit_ID
WHERE gender = 'M'


SELECT mail.mail_ID, mail.type, mail.received_time, mail.weight
FROM mail 
RIGHT JOIN deposit_location ON mail.fk_deposit_location_ID= deposit_location.deposit_ID
WHERE type = 'letter'

SELECT mail.mail_ID, mail.type, mail.received_time, mail.weight
FROM mail 
RIGHT JOIN deposit_location ON mail.fk_deposit_location_ID= deposit_location.deposit_ID
GROUP BY weight

