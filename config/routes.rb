Rails.application.routes.draw do

 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    
#顧客
    root to: 'public/homes#top'

    scope module: :public do

    get 'homes/about', to: 'homes#about', as: 'about'
    get'customers/mypage', :to =>'customers#show'
    get 'information/edit', to: 'customers#edit', as: 'edit_information'
    patch 'customers/information' => "customers#update"
    get 'customers/confirm' => "customers#confirm"
    patch 'costomers/out' => "customers#out"
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :show, :index]
    post 'orders/confirm' => "orders#confirm"
    get 'orders/thanx' => "orders#thanx"
    resources :cart_items, only: [:index, :create, :destroy, :update]
    delete 'cart_items/destroy_all' => "cart_items#destroy_all"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


#管理者
namespace :admin do

    root to: "homes#top"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]

  end

end