Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      post '/login' => 'sessions#create'
     	get '/categories' => 'expenses#index'
     	get '/expenses_by_date' => 'expenses#expenses_by_date'
      post '/add_expense' => 'expenses#add_expense'
      post '/edit_expense' => 'expenses#update'
      post '/delete_expense' => 'expenses#delete'
      get '/dashboard' => 'dashboard#index'
    end	
  end
end
