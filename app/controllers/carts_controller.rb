class CartsController < ApplicationController

    before_action :authenticate_user

    def index
        current_cart = Cart.find_by(:user => current_user, :status => "on")

        if current_cart
            @cart_items = current_cart.orders
            quantity_total(@cart_items)
            price_total(@cart_items)
        end
    end

    def create
        current_cart = Cart.find_by(:user => current_user, :status => "on")
        item = Item.find(params[:id])

        if current_cart
            if current_cart.orders
                current_cart.orders.each do |order|
                    if order.item.id == item.id
                        @reponse = true
                        @order = order
                    end
                end
                if @reponse == true
                        @order.quantity = @order.quantity + 1 
                        @order.save  #nkjdsjdjks
                else
                    order = Order.create(:cart => current_cart, :item => item, :quantity => params[:quantity])
                end
            end       
        end

        if not current_cart
            current_cart = Cart.create(:user => current_user, :status => "on")
            order = Order.create(:cart => current_cart, :item => item, :quantity => params[:quantity])
        end

        redirect_to '/', :flash => {:success => 'Produit ajouté au panier.'}

    end

    def update

    end

    def destroy

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
