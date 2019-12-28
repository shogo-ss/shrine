class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if current_user == @user
    
    if @user.update(user_params)
      flash[:success] = 'ユーザ情報を編集しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ情報の編集に失敗しました。'
      render :edit
    end
    
    else redirect_to login_url
    end
  end
  
  def wents
    @user = User.find(params[:id])
    @wents = @user.wents.page(params[:page])
    counts(@user)
  end
  
  def concerns
    @user = User.find(params[:id])
    @concerns = @user.concerns.page(params[:page])
    counts(@user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image)
  end
end
