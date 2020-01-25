class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @review = Review.new
    @user = current_user
    @shrine = Shrine.find(params[:shrine_id])
    #3.times { @review.pictures.build }
    @review.pictures.build
  end
  
  def edit
    @user = current_user
    @review = Review.find(params[:review_id])
    @shrine = Shrine.find(@review.shrine.id)
    unless @review.pictures.present?
      @review.pictures.build
    end
    unless @review.user == current_user
      redirect_to root_url
    end
    #t=3-@lesson.lesson_images.size.to_i(複数投稿)
    #t.times{@lesson.lesson_images.build}
    #3.times { @review.pictures.build } 
    #end
  end
  
  def create
    @review = Review.new(review_params)
    shrine = @review.shrine
    if @review.save
      current_user.concern?(shrine) if current_user.unconcern(shrine)
    flash[:success] = 'レビューしました'
    redirect_to shrine_url(@review.shrine.id)
    
    else
      flash.now[:danger] = 'レビューに失敗しました。'
      @user = current_user
      @shrine = shrine
      unless @review.pictures.present?
      @review.pictures.build
      end
      render :new
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def update
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      flash[:success] = 'レビューを編集しました。'
      redirect_to shrine_url(@review.shrine.id)
      
    else
      flash.now[:danger] = 'レビューの編集に失敗しました。'
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :comment, :user_id, :shrine_id, pictures_attributes: [:id, :image, :image_cache, :_destroy])
  end
end
