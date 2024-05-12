drop procedure if exists recommend_highest_rated_songs_past_month;

delimiter //
create procedure recommend_highest_rated_songs_past_month()
begin
	select s.id, s.title, average_song_rating_function(s.id) as 'avg_rating'
    from songs s 
    join song_reviews sr on (s.id = sr.song_id)
    where timestampdiff(day, sr.date_created, curdate()) <= 30
    group by s.id, s.title
    order by avg_rating desc
    limit 15;
end //
delimiter ;


drop event if exists trending_songs;

delimiter //

create event trending_songs
on schedule every 1 day
do begin
	call recommend_highest_rated_songs_past_week;
end //

call recommend_highest_rated_songs_past_month();