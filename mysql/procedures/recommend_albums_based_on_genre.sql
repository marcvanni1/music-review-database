use music_db_development;

drop procedure if exists recommend_albums_based_on_genre;

delimiter //
create procedure recommend_albums_based_on_genre(
this_user_id int
)
begin
	select a.id, a.title, average_album_rating_function(a.id)
    from album_reviews ar  
    join users u on (u.id = ar.user_id)
    right join albums a on (a.id = ar.album_id)
    join classifications c on (c.album_id = a.id)
    right join genres g 
    on (g.id = c.genre_id)
    where a.id not in 
    (select a.id 
    from album_reviews ar join albums a
    on (ar.album_id = a.id and this_user_id = ar.user_id))
    and g.id in 
	(select g.id
	from genres g join classifications c on (g.id = c.genre_id)
	join albums a on (c.album_id = a.id)
	join album_reviews ar on (a.id = ar.album_id and ar.user_id = this_user_id)
    where ar.rating >= 7)
    and 7 <= ifnull(average_album_rating_function(a.id), 10)
    group by a.id
    order by a.id;
end //
delimiter ;