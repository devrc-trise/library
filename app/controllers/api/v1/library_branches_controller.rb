class Api::V1::LibraryBranchesController < ApiController
  before_filter :find_model, only: [:show, :books, :borrowed_books]

  def index
    render json: LibraryBranch.all.map { |l| l.to_builder.attributes! }
  end

  def show
    render json: @branch.to_builder.attributes!
  end

  def books
    render json: @branch.book_locations.map { |b| b.to_builder(i_library_branch: false).attributes! }
  end

  def borrowed_books
    render json: @branch.borrowed_books.map { |b| b.to_builder(i_library_branch: false).attributes! }
  end

  private

    def find_model
      @branch = LibraryBranch.find(params[:id] || params[:library_branch_id])
    end
end
