class Admin::CafesController < ApplicationController
  before_action :set_cafe, only: [:edit, :update, :destroy]

  def edit
    # @cafeはbefore_actionで設定
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to admin_cafes_path, notice: 'カフェ情報が更新されました'
    else
      render :edit
    end
  end


  # 編集内容の更新
  def update
    @cafe = Cafe.find(params[:id])
    if @cafe.update(cafe_params)
      redirect_to admin_cafes_path, notice: 'カフェ情報が更新されました'
    else
      render :edit
    end
  end

  # カフェの削除
  def destroy
    @cafe = Cafe.find(params[:id])
    @cafe.destroy
    redirect_to admin_dashboards_path, notice: 'カフェが削除されました'
  end

  private

  def set_cafe
    @cafe = Cafe.find(params[:id])
  end

  def cafe_params
    params.require(:cafe).permit(:cafe_name, :cafe_description, :cafe_address, :image, :other_attributes)
  end
end
