class ShrinesController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show]
  
  def index
    @prefecture = Prefecture.where(area: params[:area_id])
    @shrine = Shrine.where(prefecture_id: params[:prefecture_id])
    unless @shrine.present?
      @shrine = Shrine.all
    end
  end
  
  def new
    @shrine = Shrine.new
  end
  
  def create
    @shrine = Shrine.new(shrine_params)

    if @shrine.save
      flash[:success] = '神社を登録しました。'
      redirect_to @shrine
    else
      flash.now[:danger] = '神社の登録に失敗しました。'
      render :new
    end
  end
  
  def show
    @shrine = Shrine.find(params[:id])
    @reviews = @shrine.reviews
    counts(@shrine)
  end
  
  def edit
    @shrine = Shrine.find(params[:id])
  end
  
  def update
    @shrine = Shrine.find(params[:id])
    
    if @shrine.update(shrine_params)
      flash[:success] = '神社情報を編集しました。'
      redirect_to @shrine
    else
      flash.now[:danger] = '神社情報の編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    #本当に管理userか入れる
    @shrine = Shrine.find(params[:id])
    @shrine.destroy
    flash[:success] = '神社を削除しました。'
    redirect_to shrines_url(fallback_location: root_path)
  end
  
  def review
    @review = Review.new
    @review.pictures.build
    #3.times { @review.pictures.build } 
    @user = current_user
    @shrine = Shrine.find(params[:id])
    render "reviews/new"
  end
  
  def review_edit
    @user = current_user
    @shrine = Shrine.find(params[:id])
    @review = current_user.reviews.find_by(:shrine_id [params[:id]])
    
    #if @review.pictures.count == 1
     # 2.times { @review.pictures.build }
    #elsif @review.pictures.count == 2
     # 1.times { @review.pictures.build }
    #elsif @review.pictures.count == 0
     # 3.times { @review.pictures.build }
    #end
    render "reviews/edit"
  end
  
  private

  def shrine_params
    params.require(:shrine).permit(:name, :address, :prefecture_id)
  end
end
