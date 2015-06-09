class Api::V1::BooksController < ApiController
  before_filter :find_model, only: [:show, :borrowed_books]

  def index
    render json: Book.all.map { |book| book.to_builder.attributes! }
  end

  def show
    render json: @book.to_builder.attributes!
  end

  def borrowed_books
    render json: @book.borrowed_books.map { |b| b.to_builder(i_book: false).attributes! }
  end

  private

    def find_model
      @book = Book.find(params[:id] || params[:book_id])
    end
end
