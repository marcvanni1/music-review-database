DROP PROCEDURE IF EXISTS recommend_albums_based_on_following;

DELIMITER //

CREATE PROCEDURE recommend_albums_based_on_following
(
  given_user int
)
BEGIN

    with
        user_review as (
            select user_id, album_id, rating
            from users
            left join album_reviews on (users.id = album_reviews.user_id)
        )
        
        select distinct album_id -- user_id, album_id, rating, following_id, follower_id
        from user_review
        left join follows on user_review.user_id = follows.following_id
        where follower_id = given_user and rating >= 7;
        
END //   

DELIMITER ;

call recommend_albums_based_on_following(13);
