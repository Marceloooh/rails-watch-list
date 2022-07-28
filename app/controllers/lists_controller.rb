class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.find(params[:bookmark_id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
