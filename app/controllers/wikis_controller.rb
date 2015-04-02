class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    if @wiki.save
      flash[:notice] = "Wiki Saved"
      redirect_to @wiki
    else
      flash[:error] = "Error. Bleep Blorp Bloop."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Wiki is up to date, yo!"
      redirect_to @wiki
    else
      flash[:error] = "Bleep Blorp Bloop. Error Errrrrroooooor!"
      render :edit
    end
  end
end
