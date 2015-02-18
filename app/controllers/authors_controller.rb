class AuthorsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
  	# Grab all authors.
  	@authors =  Author.all
  end

  #GET /users/new
  def new
  	@author = Author.new
  end

  #POST /authors
  #POST /authors.json
  def create
  	@author = Author.new(params.require(:author).permit(:first_name, :last_name, :year))
  	if @author.save
  		redirect_to author_url(@author)
  	else
  		redirect_to authors_url
  	end
  end

  #GET /users/1
  #GET /users/1.json
  def show
  	@author = Author.find(params[:id])
  end

  def edit
  	@author = Author.find(params[:id])
  end

  def update
  	@author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:first_name, :last_name, :year))
      redirect_to author_url(@author)
    else
      redirect_to authors_url
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url
  end

end