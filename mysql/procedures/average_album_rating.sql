use music_db_development;

drop procedure if exists average_album_rating;

delimiter //
create procedure average_album_rating(
this_album_id int
)
begin
	select round(avg(ar.rating), 2) as avg
    from albums a join album_reviews ar on (a.id = ar.album_id and a.id = this_album_id);
end //
delimiter ;

call average_album_rating(1);