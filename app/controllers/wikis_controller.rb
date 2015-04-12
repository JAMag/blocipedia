class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Darth-wiki Saved"
      redirect_to @wiki
    else
      flash[:error] = "Error. Bleep Blorp Bloop."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Darth-wiki is up to date, yo! HKHKHKahhakhawwwww... shhhhhhshhshshhsh"
      redirect_to @wiki
    else
      flash[:error] = "Bleep Blorp Bloop. Error Errrrrroooooor!"
      render :edit
    end
  end
end
