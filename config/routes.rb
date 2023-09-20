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

namespace :public do
    root to: 'homes#top'

    get 'homes/about', to: 'homes#about', as: 'about'
    get'customers/mypage', :to =>'customers#show'
    patch 'customers/information' => "customers#update"
    get 'customers/confirm' => "customers#confirm"
    patch 'costomers/out' => "customers#out"
    delete 'cart_items/destroy_all' => "cart_items#destroy_all"
    post 'orders/confirm' => "orders/confirm"
    get 'orders/thanx' => "orders#thanx"
    get 'addresses/index'
    get 'addresses/edit'
    post 'addresses/create'
    patch 'addresses/update'
    delete 'addresses/destroy'
    get 'orders/new'
    post 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    patch 'cart_items/update'
    delete 'cart_items/destroy'
    post 'cart_items/create'
    get 'items/index'
    get 'items/show'
     resources :customers do
    get 'information/edit', to: 'customers#edit', on: :member, as: 'edit_information'
    end
  end

#管理者
namespace :admin do

    root to: "homes#top"
    resources :orders, only: [:show, :update]
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]

  end

end