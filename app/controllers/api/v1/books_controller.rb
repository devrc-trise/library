class Api::V1::BooksController < ApiController
  def index
    render json: Book.all.map { |book| book.to_builder.attributes! }
  end

  def show
    render json: Book.find(params[:id]).to_builder.attributes!
  end
end
