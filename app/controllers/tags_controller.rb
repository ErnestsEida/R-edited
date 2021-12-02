class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @community = Community.find(params[:community_id])
    @posti = @community.posts.all
    @posts = []

    @posti.each do |post|
      tag = post.tags.all[0]
      if tag.title == @tag.title
        @posts << post
      end
    end

  end
end
