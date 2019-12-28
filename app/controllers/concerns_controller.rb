class ConcernsController < ApplicationController
  def create
    shrine = Shrine.find(params[:shrine_id])
    current_user.concern(shrine)
    flash[:success] = '登録しました'
    redirect_to request.referer
  end

  def destroy
    shrine = Shrine.find(params[:shrine_id])
    current_user.unconcern(shrine)
    flash[:success] = '登録を解除しました'
    redirect_to request.referer
  end
end
