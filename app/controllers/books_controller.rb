class BooksController < ApplicationController

  def new
    unless current_user.publisher
      redirect_to "/libraries"
    end
  end

  def create
    if current_user.publisher
      Library.first.books.create!(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      tagline: params[:tagline]
      )
      redirect_to "/libraries"
    else
      "You do not have the proper permission to do this"
    end
  end

  def edit
    if current_user.editor
    Book.update!(
    title: params[:title],
    author: params[:author],
    genre: params[:genre]
    )
    redirect_to "/libraries"
  else
    redirect_to "/libraries"
  end
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
