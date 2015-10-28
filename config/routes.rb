Rails.application.routes.draw do

get "/libraries" => "libraries#show"
get "/login" => "users#login"
post "/login" => "users#login_page"

delete "/logout"=>"users#logout"
get "/libraries/books/create_book" => "books#new"
get "/libraries/books/edit_book/:id" => "books#edit"

post "/libraries/books/create_book" => "books#create"

get "/libraries/users/create_user" => "users#new"
post "/libraries/users/create_user" => "users#create"

patch "/books/:id" => "books#mark_as_checked_out"
patch "/books/edit_book/:id" => "books#edit_book"
patch "/books/return/:id" => "books#returned_book"

root "libraries#index"
end
