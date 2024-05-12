class SongReviewsController < ApplicationController
    def new
        @song_review = SongReview.new
    end

    def create
        @song_review = SongReview.new(user_id: current_user.id, song_id: params[:song_review][:song_id], 
                                        rating: params[:rating].to_i, review: params[:song_review][:review],
                                        date_created: DateTime.current.to_date)

        @song_review.save
        redirect_to song_path(params[:song_review][:song_id])
    end
end
