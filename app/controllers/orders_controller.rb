class OrdersController < ApplicationController

  before_action :authenticate_user

    def create

        if UserMailer.order_email(current_user).deliver_now
            current_cart = Cart.find_by(:user => current_user, :status => "on")
            current_cart.status = "done"
            current_cart.save

            redirect_to '/', :flash => { :success => "Votre commande a été passé. Un email contenant les détails de votre commande vous a été envoyé." }
        end

    end
end
