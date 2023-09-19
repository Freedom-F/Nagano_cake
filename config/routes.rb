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
get 'public/homes/about', to: 'public/homes#about', as: 'about'
get'public/customers/mypage', :to =>'customers#show'
patch 'public/customers/information' => "public/customers#update"
get 'public/customers/confirm' => "public/customers#confirm"
patch 'public/costomers/out' => "public/customers#out"
delete 'public/cart_items/destroy_all' => "public/cart_items#destroy_all"
post 'public/orders/confirm' => "public/orders/confirm"
get 'public/orders/thanx' => "public/orders#thanx"

namespace :public do
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
    get 'orders/show'
    patch 'orders/update'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
    get 'genres/index'
    post 'genres/create'
    get 'genres/edit'
    patch 'genres/update'
    get 'items/index'
    get 'items/new'
    post 'items/create'
    get 'items/show'
    get 'items/edit'
    patch 'items/update'
    get 'homes/admin' => "homes#top"
  end

end