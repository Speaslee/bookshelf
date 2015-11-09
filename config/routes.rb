Rails.application.routes.draw do

get "/libraries" => "libraries#show"
get "/libraries/user_list" => "libraries#userlist"

get "/libraries/books/create_book" => "books#new"
get "/libraries/books/edit_book/:id" => "books#edit"
get "/libraries/books/profile/:id" => "books#profile"
post "/libraries/books/create_book" => "books#create"
delete "/books/delete_book/:id" => "books#delete"
patch "/books/:id" => "books#mark_as_checked_out"
patch "/books/edit_book/:id" => "books#edit_book"
patch "/books/return/:id" => "books#returned_book"

get "/libraries/users/create_user" => "users#new"
post "/libraries/users/create_user" => "users#create"
get "/libraries/users/profile/:id" => "users#profile"
get "/login" => "users#login"
post "/login" => "users#login_page"
delete "/logout"=>"users#logout"
get "/users/assign_admin/:id" =>"users#admin"
patch "/users/assign_admin/:id" =>"users#assign_admin"
delete "/users/assign_admin/:id"=>"users#delete_admin"


get "/users/edit"=>"address#edit"
patch "/users/edit_user"=>"address#edit_user"
get "/users/add_address"=>"address#new"
post "/users/add_address"=> "address#create"
delete "/users/delete_address/:id" => "address#delete"


get "/auth/google_login/callback" =>"users#google_oauth2"


root "libraries#index"
end
