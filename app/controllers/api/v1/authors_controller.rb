class Api::V1::AuthorsController < ApiController
  before_filter :find_model, only: [:show, :books]

  def index
    render json: Author.all.map { |book| book.to_builder.attributes! }
  end

  def show
    render json: @author.to_builder.attributes!
  end

  def books
    render json: @author.books.map { |b| b.to_builder(i_authors: false).attributes! }
  end

  private

    def find_model
      @author = Author.find(params[:id] || params[:author_id])
    end
end
