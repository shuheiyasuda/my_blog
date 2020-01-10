class RegisrationsController < ApplicationController

  def signup
    @user = User.new
  end

  def signup_validates
    session[:icon] = user_params[:icon]
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]

    @user = User.new(
      icon: session[:icon],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password]
    )
    
    @user.valid?

    skip_validate(@user.errors)

    if @user.errors.messages.blank? && @user.errors.details.blank?
      redirect_to signup_2_regisrations_path
    else
      render :signup
    end

  end


  def signup_2
    @user = User.new
  end

  def create
    @user = User.new(
      icon: session[:icon],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: user_params[:last_name],
      first_name: user_params[:first_name],
      year_id: user_params[:year_id],
      month_id: user_params[:month_id],
      date_id: user_params[:date_id],
      phone_number: user_params[:phone_number]
    )

    if @user.errors.messages.blank? && @user.errors.details.blank?
      if @user.save
        sign_in User.find(@user.id) unless user_signed_in?
        session.delete(:icon)
        session.delete(:nickname)
        session.delete(:email)
        session.delete(:password)
        session.delete(:last_name)
        session.delete(:first_name)
        session.delete(:year_id)
        session.delete(:month_id)
        session.delete(:date_id)
        session.delete(:phone_number)
        redirect_to root_path
      else
        render :signup_2
      end
    else
      render :signup_2
    end
  end



  private

  def user_params
    params.require(:user).permit(:icon, :nickname,:email, :password, :last_name, :first_name,
                                 :year_id, :month_id, :date_id, :phone_number)
  end

  def skip_validate(errors)
    errors.messages.delete(:last_name)
    errors.details.delete(:last_name)
    errors.messages.delete(:first_name)
    errors.details.delete(:first_name)
    errors.messages.delete(:year_id)
    errors.details.delete(:year_id)
    errors.messages.delete(:month_id)
    errors.details.delete(:month_id)
    errors.messages.delete(:date_id)
    errors.details.delete(:date_id)
    errors.messages.delete(:phone_number)
    errors.details.delete(:phone_number)
  end

end
