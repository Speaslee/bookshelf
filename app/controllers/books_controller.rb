class BooksController < ApplicationController


  def create
    current_bookshelf.books.create(
    title: params[:title],
    author: params[:author],
    genre: params[:genre],
    tagline: prarams[:tagline]
    )
  end

  def mark_as_checked_out
    book = Book.find params[:id]
    book.is_checked_out
    redirect_to "/libraries"
  end

  def returned_book
    book = Book.find params[:id]
    book.return_book
    redirect_to "/libraries"
  end
end
