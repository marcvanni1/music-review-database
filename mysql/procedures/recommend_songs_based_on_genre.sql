use music_db_development;

drop procedure if exists recommend_songs_based_on_genre;

delimiter //
create procedure recommend_songs_based_on_genre(
this_user_id int
)
begin
	select s.id, s.title, average_song_rating_function(s.id)
    from song_reviews sr  
    join users u on (u.id = sr.user_id)
    right join songs s on (s.id = sr.song_id) -- and 7 <= ifnull(average_song_rating_function(s.id), 10))
    join classifications c on (c.song_id = s.id)
    right join genres g 
    on (g.id = c.genre_id)
    where s.id not in 
    (select s.id 
    from song_reviews sr join songs s 
    on (sr.song_id = s.id and this_user_id = sr.user_id))
    and g.id in 
    (select g.id
    from genres g join classifications c on (g.id = c.genre_id)
    join songs s on (c.song_id = s.id)
    join song_reviews sr on (s.id = sr.song_id and sr.user_id = this_user_id)
    where sr.rating >= 7)
    and 7 <= ifnull(average_song_rating_function(s.id), 10)
    group by s.id
    order by s.id;
end //
delimiter ;
call recommend_songs_based_on_genre(1);