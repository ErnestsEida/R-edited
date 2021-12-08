class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = Kaminari.paginate_array(@tag.posts.all).page(params[:page]).per(3)
  end
end
