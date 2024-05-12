use music_db_development;

drop function if exists main_artist_of_song;

delimiter //
create function main_artist_of_song(
this_song_id int
)
returns float
deterministic
begin
    declare main_artist_id float;
    
	set main_artist_id = (
    select a.id
    from songs s join song_by_artists sba on (s.id = sba.song_id and s.id = this_song_id)
    join artists a on (sba.artist_id = a.id)
    join album_by_artists aba on (aba.artist_id = a.id)
    join albums alb on (alb.id = aba.album_id)
    join tracklists t on (alb.id = t.album_id and t.song_id = this_song_id)
    );
    
    return main_artist_id;
end //
delimiter ;

select concat(main_artist_of_song(1));