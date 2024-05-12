drop procedure if exists follow_user;

delimiter //
create procedure create_account
(
  in user_name_param varchar(255)
)
begin
  declare message varchar(255);

  if((select count(*) from users where user_name_param = username) = 1) then
    select concat(user_name_param, ' is already taken.') into message;
	signal sqlstate 'HY000' set message_text = message;
  end if;
  
  insert into users values
    (user_name_param);

end //
delimiter ;
    