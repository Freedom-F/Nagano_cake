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
    get 'homes/about', to: 'homes#about', as: 'about'

    namespace :public do

    get'customers/mypage', :to =>'customers#show'
    patch 'customers/information' => "customers#update"
    get 'customers/confirm' => "customers#confirm"
    patch 'costomers/out' => "customers#out"
    delete 'cart_items/destroy_all' => "cart_items#destroy_all"
    post 'orders/confirm' => "orders#confirm"
    get 'orders/thanx' => "orders#thanx"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get 'orders/new'
    post 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    patch 'cart_items/:id' => "cart_items#update"
    delete 'cart_items/:id' => "cart_items#destroy"
    post 'cart_items/create'
    resources :items, only: [:index, :show]
    get 'information/edit', to: 'customers#edit', as: 'edit_information'
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