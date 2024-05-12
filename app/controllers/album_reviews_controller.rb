class AlbumReviewsController < ApplicationController

    def new
        @album_review = AlbumReview.new
    end

    def create
        @album_review = AlbumReview.new(user_id: current_user.id, album_id: params[:album_review][:album_id], 
                                        rating: params[:rating].to_i, review: params[:album_review][:review],
                                        date_created: DateTime.current.to_date)

        @album_review.save
        redirect_to album_path(params[:album_review][:album_id])
    end
end
