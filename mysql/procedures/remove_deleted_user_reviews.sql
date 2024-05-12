drop trigger if exists remove_deleted_user_reviews;

delimiter //

create trigger remove_deleted_user_reviews
	before delete
    on users for each row
begin
	delete from album_reviews
    where album_reviews.user_id = old.id;
    
	delete from song_reviews
    where song_reviews.user_id = old.id;
    
    delete from follows
    where follows.follower_id = old.id;
    
    delete from follows
    where follows.following_id = old.id;
end; //

delimiter ;

-- test
insert into users values (9753, 'delete', 'delete');
select * from users;
insert into album_reviews values (97530, 3, 'wowee', 1, 9753, now());
select * from album_reviews;
insert into song_reviews values (97530, 'wowe song', 5, 5, 9753, now());
select * from song_reviews;
insert into follows values (10001, 1, 9753);
insert into follows values (10002, 9753, 1);
select * from follows;
delete from users where id = 9753;
select * from users;
select * from album_reviews;
select * from song_reviews;
select * from follows;