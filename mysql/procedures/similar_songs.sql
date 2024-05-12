drop procedure if exists similar_songs;

delimiter //

create procedure similar_songs
(
	given_song int
)
begin
    select distinct s.id, s.title, count(s.id) as 'num_similar_genres'
    from songs s
    join classifications c on (c.song_id = s.id)
    right join genres g on (g.id = c.genre_id)
    where s.id != 1
    and s.id in (select distinct s1.id from songs s1 join classifications c1 on (c1.song_id = s1.id))
    group by s.id
    order by num_similar_genres desc
    limit 10;
end //

delimiter ;

call similar_songs(1);
