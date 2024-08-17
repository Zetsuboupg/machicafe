class AdministratorsController < ApplicationController
  before_action :authenticate_user!

  # 必要なアクション（例: index, show, etc.）をここに追加してください
end