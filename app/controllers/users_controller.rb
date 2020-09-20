class UsersController < ApplicationController

    def profil
        @user = current_user
    end

    def update
        @user = current_user.update
    end

end
