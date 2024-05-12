DROP PROCEDURE IF EXISTS recommend_users_based_on_albums;

DELIMITER //

CREATE PROCEDURE recommend_users_based_on_albums
(
  given_user int
)
BEGIN
    with
    user_review as (
        select user_id, album_id, rating
        from users
        left join album_reviews on (users.id = album_reviews.user_id)
    ),
    
    album_overlap as (
        select given_user as given_user, user_id, album_id, rating
        from user_review
        where album_id in (
            select album_id
            from user_review
            where rating >= 7 and user_id = given_user)
        order by user_id
    ),
    
    similar_users as (
        select a.user_id as following, a.given_user as follower, overlap_count
        from album_overlap as a
        left join (
            select given_user, user_id, count(*) as overlap_count
            from album_overlap
            where rating >= 7 and user_id != given_user
            group by user_id
        ) as b on a.user_id = b.user_id and a.given_user = b.given_user
    group by a.user_id, overlap_count
    having overlap_count/count(*) > .5
    )
    
    select following
    from similar_users
    left join follows on follower = follows.follower_id and following = follows.following_id
    where follows.following_id is null;
    
END //   

DELIMITER ;

call recommend_users_based_on_albums(1);
