class Api::V1::PublishersController < ApiController
  def index
    render json: Publisher.all.map { |p| p.to_builder.attributes!  }
  end

  def show
    render json: Publisher.find(params[:id]).to_builder.attributes!
  end

  def books
    render json: Publisher.find(params[:publisher_id]).books.map { |b| b.to_builder(i_publisher: false).attributes! }
  end
end
