class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  #roomを削除したときに、関連するレコードも削除される。

  has_many :users, through: :room_users

  has_many :messages, dependent: :destroy
  #

  validates  :name, presence:true
end
