class UsersController < ApplicationController
    helper_method :user_recs

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(params.require(:user).permit(:username,        
        :password))
        if !@user.errors.any? && @user.save
            session[:user_id] = @user.id
            redirect_to welcome_index_path
        else
            render new_user_path
        end
    end

    def destroy
        @user = User.find(current_user.id)
        session.delete(current_user.id)
        @user.destroy
        redirect_to welcome_index_path
    end

     def search
        if params[:search] != nil
            input = params[:search].downcase
            @results = User.all.where("lower(username) LIKE :search", search: "%"+input+"%")
        end
    end

    def unfollow
        @user = User.find(params[:id])
        StoredProcedures.unfollow(current_user, @user)
        redirect_to user_path(@user)
    end

    def follow
        @user = User.find(params[:id])
        StoredProcedures.follow(current_user, @user)
        redirect_to user_path(@user)
    end

    def user_recs
        sql_recs = StoredProcedures.user_song_rec(current_user.id)
        recs = []
        displayed_recs = []
        sql_recs.each do |rec|
          recs << rec['following']
        end

        sql_recs = StoredProcedures.user_album_rec(current_user.id)
        sql_recs.each do |rec|
          recs << rec['following']
        end

        5.times do
            if recs.size > 0
              random = rand(recs.size)
              displayed_recs << User.where(id: recs[random]).first
              recs.delete_at(random)
            end
          end
      
        displayed_recs.uniq
    end
end
