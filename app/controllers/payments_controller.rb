class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    # create charge on stripe server. This will charge the customer
    begin
      charge = Stripe::Charge.create(
        :amount => params[:productPrice], # amount in cents, again 
        :currency => "usd",
        :source => token,
        :description => "New Order: #{params[:productName]} from #{params[:stripeEmail]}."
        )
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(product)
  end