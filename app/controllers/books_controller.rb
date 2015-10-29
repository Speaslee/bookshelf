class BooksController < ApplicationController

  def new
    @book = Book.new
    unless current_user.publisher
      redirect_to "/libraries"
    end
  end

  def create
    if current_user.publisher
      expand = GooleBooks.search(params[:title], inauthor:params[:author]).first
      @book=Library.first.books.new(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      tagline: params[:tagline],
      publisher: expand.publisher,
      published_date: expand.published_date,
      description: expand.description,
      isbn: expand.isbn,
      page_count: expand.page_count,
      average_rating: expand.average_rating,
      preview_link: expand.preview_link,
      image_link: expand.image_link
      )
      if @book.save
        flash[:sucess] = "Book added"
      redirect_to "/libraries/"
    else
      flash[:danger]= "Fields can't be blank"
      render :new
    end

    else
      redirect_to "/libraries"
    end
  end

  def edit
    unless current_user.editor
      redirect_to "/libraries"
    end
  end

  def edit_book
    if current_user.editor
      book = Book.find params[:id]
      good_params = params.permit(:title, :author, :genre).select{|k,v| v.present?}
      book.update(
      good_params
      )
      redirect_to "/libraries"
    else
      redirect_to "/libraries"
    end
  end

  def profile
    unless current_user
      redirect_to "/libraries"
    end
  end

  def delete
    if current_user.publisher
      book = Book.find params[:id]
      book.destroy
      redirect_to "/libraries"
    else
      redirect_to "/libraries"
    end
  end


  def mark_as_checked_out
    book = Book.find params[:id]
    book.is_checked_out
    Checkout.create!(user_id: current_user.id, book_id: book.id)
    redirect_to "/libraries"
  end

  def returned_book
    book = Book.find params[:id]
    book.return_book
    redirect_to "/libraries"
  end
end
