use music_db_development;

drop procedure if exists recommend_highest_rated_albums;

delimiter //
create procedure recommend_highest_rated_albums()
begin
	select id, title, average_album_rating_function(id)
    from albums
    group by id, title
    order by average_album_rating_function(id) desc
    limit 15;
end //
delimiter ;
