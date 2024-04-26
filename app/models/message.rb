class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true
  #message内容が空で投稿されるのを防ぐ。
end
