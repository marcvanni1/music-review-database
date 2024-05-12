use music_db_development;

drop procedure if exists recommend_highest_rated_songs;

delimiter //
create procedure recommend_highest_rated_songs()
begin
	select id, title, average_song_rating_function(id)
    from songs
    group by id, title
    order by average_song_rating_function(id) desc
    limit 25;
end //
delimiter ;

call recommend_highest_rated_songs();