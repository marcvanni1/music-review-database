use music_db_development;

drop procedure if exists recommend_artists_based_on_songs;

delimiter //
create procedure recommend_artists_based_on_songs(
this_user_id int
)
begin
select art.id, art.name, s.title
from artists art join song_by_artists sba on (art.id = sba.artist_id)
join songs s on (s.id = sba.song_id)
join song_reviews sr on (sr.song_id = s.id and sr.user_id = this_user_id)
where art.id != main_artist_of_song(s.id)
and art.id not in
(select main_artist_of_song(s.id)
from song_reviews sr join songs s on (sr.song_id = s.id and sr.user_id = 1))
and sr.rating >= 7;
end //
delimiter ;

call recommend_artists_based_on_songs(11);