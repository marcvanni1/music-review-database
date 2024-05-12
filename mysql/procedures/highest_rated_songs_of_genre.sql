use music_db_development;

drop procedure if exists highest_rated_songs_of_genre;

delimiter //
create procedure highest_rated_songs_of_genre(
this_genre_id int
)
begin
	select distinct s.id
    from songs s 
    join classifications c on (c.song_id = s.id)
    join genres g on (c.genre_id = g.id and g.id = this_genre_id)
    where average_song_rating_function(s.id) >= 9;
end //
delimiter ;
