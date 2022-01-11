class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.all
    @posts_length = @posts.length
    @posts = Kaminari.paginate_array(@posts).page(params[:post_page]).per(3)
    @communities = @tag.communities.all
    @communities_length = @communities.length
    @communities = Kaminari.paginate_array(@communities).page(params[:community_page]).per(3)
  end
end
