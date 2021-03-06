class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if current_user == @user
    
    if @user.update(user_params)
      flash[:success] = 'ユーザ情報を編集しました。'
      redirect_to wents_user_path(@user)
    else
      flash.now[:danger] = 'ユーザ情報の編集に失敗しました。'
      render :edit
    end
    
    else redirect_to login_url
    end
  end
  
  def reviews
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(created_at: :desc).page(params[:page])
    counts(@user)
    render "users/show_wents"
  end
  
  def concerns
    @user = User.find(params[:id])
    @reviews = @user.concerns.order(created_at: :desc).page(params[:page])
    counts(@user)
    render "users/show_concerns"
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :remove_user_image)
  end
end
