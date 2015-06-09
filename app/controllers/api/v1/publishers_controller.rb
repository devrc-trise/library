class Api::V1::PublishersController < ApiController
  before_filter :find_model, only: [:show, :books]

  def index
    render json: Publisher.all.map { |p| p.to_builder.attributes!  }
  end

  def show
    render json: @publisher.to_builder.attributes!
  end

  def books
    render json: @publisher.books.map { |b| b.to_builder(i_publisher: false).attributes! }
  end

  private

    def find_model
      @publisher = Publisher.find(params[:id] || params[:publisher_id])
    end
end
