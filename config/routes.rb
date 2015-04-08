Rails.application.routes.draw do
  get 'categories/index'

  root 'categories#index'
  match 'search(/:page_number)' => 'search#search', via: [:get, :post], as: 'search'
  match 'search_dynamic' => 'search#search_dynamic', via: [:get, :post], as: 'search_dynamic'
end
