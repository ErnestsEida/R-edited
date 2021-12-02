class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @communities = Community.joins(:tags).where(tags: { title: @tag.title })
    @posts = Post.joins(:tags).where(tags: { title: @tag.title })
  end
end
