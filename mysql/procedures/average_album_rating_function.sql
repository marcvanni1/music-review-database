use music_db_development;

drop function if exists average_album_rating_function;

delimiter //
create function average_album_rating_function(
this_album_id int
)
returns float
deterministic
begin
    declare average float;
    
	set average = (select round(avg(ar.rating), 2)
    from albums a join album_reviews ar on (a.id = ar.album_id and a.id = this_album_id));
    
    return average;
end //
delimiter ;