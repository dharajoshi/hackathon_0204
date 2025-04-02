class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/:id
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # POST /authors
  def create
    @author = Author.new(author_params)
    if @author.save!
      @authors = Author.count
      respond_to do |format|
        format.turbo_stream
      end 
    end
  end

  # GET /authors/:id/edit
  def edit
  end

  # PATCH/PUT /authors/:id
  def update
    if @author.update(author_params)
      redirect_to authors_path, notice: 'Author was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /authors/:id
  def destroy
    @author.destroy
    redirect_to authors_path, notice: 'Author was successfully deleted.'
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :bio)
  end
end