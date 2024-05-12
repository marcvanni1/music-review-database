drop procedure if exists recommend_highest_rated_albums_past_week;

delimiter //
create procedure recommend_highest_rated_albums_past_month()
begin
	select a.id, a.title, average_album_rating_function(a.id) as 'avg_rating'
    from albums a join album_reviews ar on (a.id = ar.album_id)
    where timestampdiff(day, ar.date_created, curdate()) <= 30
    group by a.id, a.title
    order by avg_rating desc
    limit 15;
end //
delimiter ;


drop event if exists trending_albums;

delimiter //

create event trending_albums
on schedule every 1 day
do begin
	call recommend_highest_rated_albums_past_week;
end //