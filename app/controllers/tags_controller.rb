class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = Kaminari.paginate_array(@tag.posts.all).page(params[:post_page]).per(3)
    @communities = Kaminari.paginate_array(@tag.communities.all).page(params[:community_page]).per(3)
  end
end
