class ApiController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def not_found_error
    render json: {message: 'Record not found'}, status: :not_found
  end
end
