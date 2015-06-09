class Api::V1::BorrowersController < ApiController
  before_filter :find_model, only: [:show, :borrowed_books]

  def index
    render json: Borrower.all.map { |b| b.to_builder.attributes! }
  end

  def show
    render json: @borrower.to_builder.attributes!
  end

  def borrowed_books
    render json: @borrower.borrowed_books.map { |b| b.to_builder(i_borrower: false).attributes! }
  end

  private

    def find_model
      @borrower = Borrower.find(params[:id] || params[:borrower_id])
    end
end
