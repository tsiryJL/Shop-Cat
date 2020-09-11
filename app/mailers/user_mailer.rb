class UserMailer < ApplicationMailer

  default from: 'cat-store.com'

  def order_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    @current_cart = Cart.find_by(:user => user, :status => "on")
    quantity_total(@current_cart.orders)
    price_total(@current_cart.orders)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://cat-store/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Merci pour votre commande!')
  end


  def quantity_total(orders)
      cart_items_to_sum = orders
      @quantity_total = 0
      cart_items_to_sum.each do |item|
          @quantity_total = @quantity_total + item.quantity
      end
      return @quantity_total
  end

  def price_total(orders)
      cart_items_to_sum = orders
      @price_total = 0

      cart_items_to_sum.each do |product|
          each_line_price = product.quantity * product.item.price
          @price_total =  @price_total + each_line_price
      end
      return @price_total
  end


end
