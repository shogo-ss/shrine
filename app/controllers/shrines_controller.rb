class ShrinesController < ApplicationController
  before_action :require_user_logged_in, except: [:index]
  
  def index
    @prefecture = Prefecture.where(area: params[:area_id])
    if params[:prefecture_id].present?
      @shrine = Shrine.where(prefecture_id: params[:prefecture_id]).order(id: :asc)
    else
      @shrine = Shrine.where(prefecture_id: @prefecture.pluck(:id)).order(id: :asc)
    end
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
    @reviews = @shrine.reviews.order(created_at: :desc)
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
  
  private

  def shrine_params
    params.require(:shrine).permit(:name, :address, :prefecture_id)
  end
end
