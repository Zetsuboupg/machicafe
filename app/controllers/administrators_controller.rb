class AdministratorsController < ApplicationController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 必要なアクション（例: index, show, etc.）をここに追加してください
end