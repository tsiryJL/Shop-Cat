class AvatarsController < ApplicationController
    def create
        @user = current_user
        if params[:avatar]
            @user.avatar.attach(params[:avatar])
            redirect_to users_profil_path
        else
           redirect_to users_profil_path, :flash => { :success => "Votre profil est à jour" }
        end
    end
end
