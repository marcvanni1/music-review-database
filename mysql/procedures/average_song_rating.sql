use music_db_development;

drop procedure if exists average_song_rating;

delimiter //
create procedure average_song_rating(
this_song_id int
)
begin
	select round(avg(sr.rating), 2) as avg
    from songs s join song_reviews sr on (s.id = sr.song_id and s.id = this_song_id);
end //
delimiter ;

call average_song_rating(3);