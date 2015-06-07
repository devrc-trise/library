class Api::V1::AuthorsController < ApiController
  def index
    render json: Author.all.map { |book| book.to_builder.attributes! }
  end

  def show
    render json: Author.find(params[:id]).to_builder.attributes!
  end
end
