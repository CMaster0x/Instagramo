class SessionsController <  ApplicationController
  skip_before_action :authorize!

  def new
    @user = User.new
  end
  def create
    @user =  User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      cookies.encrypted[:user_id] = @user.id
      redirect_to root_path
    else 
      @user = User.new(email: session_params[:email])
      render :new
    end
  end
  def destroy
    cookies.delete :user_id
    redirect_to root_path
  end

  private 
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
