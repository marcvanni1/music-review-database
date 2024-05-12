drop procedure if exists similar_albums;

delimiter //

create procedure similar_albums
(
	given_album int
)
begin
    select distinct a.id, a.title, count(a.id) as 'num_similar_genres'
    from albums a
    join classifications c on (a.id = c.album_id)
    join genres g on (c.genre_id = g.id)
    where a.id != given_album
    and a.id in (select distinct a1.id from albums a1 join classifications c1 on (c1.album_id = a1.id))
    group by a.id
    order by num_similar_genres desc
    limit 10;
end //

delimiter ;

call similar_albums(1);
