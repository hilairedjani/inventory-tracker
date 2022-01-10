Rails.application.routes.draw do

  resources :types
  root to: "items#index"


  resources :inventories
  resources :items do
    collection do
      post :bulk_delete, to: "items#bulk_destroy"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
