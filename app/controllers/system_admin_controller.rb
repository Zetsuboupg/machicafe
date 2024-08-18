class SystemAdminController < ApplicationController
  before_action :authenticate_user!  # Deviseの認証を適用
  before_action :check_admin  # 管理者権限を確認

  # ユーザー管理アクション
  def users_index
    @users = User.all
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to system_admin_users_index_path, notice: "ユーザー情報が更新されました。"
    else
      render :edit_user
    end
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to system_admin_users_index_path, notice: "ユーザーが削除されました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end

  def check_admin
    unless current_user.admin?
      flash[:alert] = "管理者権限が必要です。"
      redirect_to(root_path)
    end
  end
end
