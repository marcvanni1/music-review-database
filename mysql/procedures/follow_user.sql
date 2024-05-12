drop procedure if exists follow_user;

delimiter //
-- user 1 follows user 2
create procedure follow_user
(
  in user1_name_param varchar(255),
  in user2_name_param varchar(255)
)
begin
  declare user1_id_var int;
  declare user2_id_var int;
  
  declare message varchar(255);
  
  select id
  into user1_id_var
  from users
  where user1_name_param = username;
    
  select id
  into user2_id_var
  from users
  where user2_name_param = username;
    

  if((select count(*) from follows where user1_id_var = follower_id and user2_id_var = following_id) = 1) then
    select concat(user1_name_param, ' already follows ', user2_name_param, '.') into message;
	signal sqlstate 'HY000' set message_text = message;
  end if;
  
  insert into follows (follower_id, following_id) values
    (user1_id_var, user2_id_var);

end //
delimiter ;
    