use music_db_development;

drop function if exists average_song_rating_function;

delimiter //
create function average_song_rating_function(
this_song_id int
)
returns float
deterministic
begin
    declare average float;
    
	set average = (select round(avg(sr.rating), 2)
    from songs s join song_reviews sr on (s.id = sr.song_id and s.id = this_song_id));
    
    return average;
end //
delimiter ;