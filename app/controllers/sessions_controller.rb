class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(reg_no: params[:session][:reg_no])
    if user && user.authenticate(params[:session][:password])
     	log_in user
      redirect_to books_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
