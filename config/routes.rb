Rails.application.routes.draw do
  get 'messages/index'
  root to: "rooms#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do #destroy追加。チャットルーム削除機能。
    resources :messages, only: [:index, :create]
  end
  # room_idを含んだメッセージページを表示させるURLとなり、そこからアクションが呼び出される。
  # resources :messages, only: [:index, new, :create]
end
