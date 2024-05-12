DROP PROCEDURE IF EXISTS recommend_songs_based_on_following;

DELIMITER //

CREATE PROCEDURE recommend_songs_based_on_following
(
  given_user int
)
BEGIN

	with
		user_review as (
			select user_id, song_id, rating
			from users
			left join song_reviews on (users.id = song_reviews.user_id)
		)
		
		select distinct song_id -- user_id, song_id, rating, following_id, follower_id
		from user_review
		left join follows on user_review.user_id = follows.following_id
		where follower_id = given_user and rating >= 7;
        
END //   

DELIMITER ;

call recommend_songs_based_on_following(13);
