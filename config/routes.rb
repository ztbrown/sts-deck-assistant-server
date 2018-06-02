Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :characters, param: :title, only: [] do
    resources :cards, only: [:show, :index], param: :name
  end
end
