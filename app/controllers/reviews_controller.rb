class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @review = Review.new(review_params)
    
    if @review.save
    flash[:success] = 'レビューしました'
    redirect_to shrine_url(@review.shrine.id)
    
    else
      flash.now[:danger] = 'レビューに失敗しました。'
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
    params.require(:review).permit(:evaluation, :comment, :user_id, :shrine_id)
  end
end