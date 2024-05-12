use music_db_development;

drop procedure if exists highest_rated_albums_of_genre;

delimiter //
create procedure highest_rated_albums_of_genre(
this_genre_id int
)
begin
	select distinct a.id, a.title, g.genre_name, average_album_rating_function(a.id)
    from albums a 
    join classifications c on (c.album_id = a.id)
    join genres g on (c.genre_id = g.id and g.id = this_genre_id)
    where average_album_rating_function(a.id) >= 9;
end //
delimiter ;
