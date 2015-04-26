class CollaborationsController < ApplicationController

def create
@collaboration = Collaboration.new(params.require(:collaboration).permit(:user_id))
@collaboration.wiki_id = params[:wiki_id]
@wiki = Wiki.find(params[:wiki_id])
  if @collaboration.save
      flash[:notice] = "Alliance Saved"
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "Error. Bleep Blorp Bloop."
      redirect_to edit_wiki_path(@wiki)
    end
end

end