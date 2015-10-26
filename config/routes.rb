Rails.application.routes.draw do

get "/bookshelfs" => "bookshelfs#show"

get "/bookshelfs/books/create_book" => "books#new"
post "/bookshelfs/books/create_book" => "books#create"

get "users/create_user" => "users#new"
post "users/create_user" => "users#create"

patch "/books/:id" => "books#mark_as_checked_out"
end
