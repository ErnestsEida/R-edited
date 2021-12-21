class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @communities = @tag.communities.page(params[:community_page])
    @posts = @tag.posts.page(params[:post_page])
  end
end
