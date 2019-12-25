class ReviewsController < ApplicationController
  
  #def new
    #@review = Review.new
  #end
  
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
  end
end

private

  def review_params
    params.require(:review).permit(:evaluation, :comment, :user_id, :shrine_id)
  end

#  def edit
#  end

#  def update
#  end
