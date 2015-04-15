Rails.logger.info "@@@@@@@@@@@@@@@@@@@@@@@ The Stripe Key: #{Rails.configuration.stripe[:publishable_key]}"
class ChargesController < ApplicationController

  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    customer: customer.id,
    amount: Amount.default,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )

    flash[:success] = "Thanks for all the money, #{current_user.email}! Give me more."
    redirect_to user_path(current_user)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: 1_00
     
    }
  end

end
