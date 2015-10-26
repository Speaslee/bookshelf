Rails.application.routes.draw do

get "/libraries" => "libraries#show"

get "/libraries/books/create_book" => "books#new"
post "/libraries/books/create_book" => "books#create"

get "/libraries/users/create_user" => "users#new"
post "/libraries/users/create_user" => "users#create"

patch "/books/:id" => "books#mark_as_checked_out"
patch "/books/return/:id" => "books#returned_book"

root "libraries#index"
end
