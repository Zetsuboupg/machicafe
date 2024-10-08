class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:index, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザーが削除されました。"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def check_admin
    redirect_to(root_path, alert: "管理者権限が必要です。") unless current_user.admin?
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
