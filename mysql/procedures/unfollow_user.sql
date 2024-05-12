drop procedure if exists follow_user;

delimiter //
-- user 1 unfollows user 2
create procedure unfollow_user
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
    

  if((select count(*) from follows where user1_id_var = follower_id and user2_id_var = following_id) = 0) then
    select concat(user1_name_param, ' does not follow ', user2_name_param, '.') into message;
	signal sqlstate 'HY000' set message_text = message;
  end if;
  
  delete from follows where
    user1_id_var = follower_id and
    user2_id_var = following_id;

end //
delimiter ;
    