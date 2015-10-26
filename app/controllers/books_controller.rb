class BooksController < ApplicationController


  def create
    current_bookshelf.books.create(
    title: params[:title],
    author: params[:author]
    genre: params[:genre]
    tagline: prarams[:tagline]
    )
end
end
