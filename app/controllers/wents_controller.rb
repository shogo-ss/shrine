class WentsController < ApplicationController
  def create
    shrine = Shrine.find(params[:shrine_id])
    current_user.went(shrine)
    if current_user.concern?(shrine)
      current_user.unconcern(shrine)
    end
    flash[:success] = '登録しました'
    redirect_to review_shrine_path(shrine)
  end

  def destroy
    shrine = Shrine.find(params[:shrine_id])
    review = current_user.reviews.find_by(:shrine_id [params[:shrine_id]])
    current_user.unwent(shrine)
    review.destroy
    flash[:success] = '登録を解除しました'
    redirect_to request.referer
  end
end
