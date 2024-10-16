# app/controllers/public/renai_controller.rb

require 'httparty'
require 'json'

class Public::RenaiController < ApplicationController
  def index
    if request.post?
      api_key = Rails.application.credentials.openai[:api_key]
      user_input = params[:user_input]
      @user_input = user_input  # ビューで再表示するため

      if user_input.present?
        begin
          # APIエンドポイントの設定
          url = "https://api.openai.com/v1/chat/completions"

          # ヘッダーの設定
          headers = {
            "Content-Type" => "application/json",
            "Authorization" => "Bearer #{api_key}"
          }

          # リクエストボディの作成
          body = {
            model: "gpt-3.5-turbo",
            messages: [
              { role: "system", content: "You are a helpful assistant." },
              { role: "user", content: user_input }
            ],
            max_tokens: 500
          }.to_json

          # APIへのリクエスト
          response = HTTParty.post(url, headers: headers, body: body)

          if response.code == 200
            parsed_response = JSON.parse(response.body)
            @result = parsed_response.dig("choices", 0, "message", "content")
          else
            @result = "接続失敗: #{response.code} #{response.message}"
          end
        rescue => e
          @result = "エラーが発生しました: #{e.message}"
        end
      else
        @result = "相談内容を入力してください。"
      end
    end
  end
end
