class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def create
    @list = List.create(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.find(params[:bookmark_id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
