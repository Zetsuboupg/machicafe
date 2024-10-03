require 'openai'

class Public::RenaiController < ApplicationController
  def index
    api_key = ENV['OPENAI_API_KEY']


      client = OpenAI::Client.new(api_key: api_key) # 'access_token'を'api_key'に変更


      begin
        response = client.completions.create(
        parameters: {
        model: "gpt-3.5-turbo", # モデル指定
        messages: [
          { role: "system", content: "You are a helpful assistant." },
          { role: "user", content: prompt }
        ],
        max_tokens: 1000
      }
    )

        @result = response.dig("choices", 0, "message", "content")
      rescue => e
        @result = "接続失敗: #{e.message}"
      end
  end

end
