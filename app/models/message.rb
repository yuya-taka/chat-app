class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  has_one_attached :image
  # Active Storageのテーブルで管理された画像ファイルのアソシエーションの記述。
  # imageはファイル名となる。これはパラメーターのキーにもなる。

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end


  # validates :content, presence: true
  #message内容が空で投稿されるのを防ぐ。
end
