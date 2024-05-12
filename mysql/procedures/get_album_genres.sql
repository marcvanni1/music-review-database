use music_db_development;

drop procedure if exists get_album_genres;

delimiter //
create procedure get_album_genres(
this_album_id int
)
begin
	select distinct g.id
    from albums a join tracklists t on (a.id = t.album_id and a.id = this_album_id)
    join songs s on (s.id = t.song_id)
    join classifications c on (c.song_id = s.id)
    join genres g on (c.genre_id = g.id);
end //
delimiter ;
