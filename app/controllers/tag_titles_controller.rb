class TagTitlesController < ApplicationController
  def show
    @tag = TagTitle.find(params[:id])
    @community = Community.find(params[:community_id])
    @posti = @community.posts.all
    @posts = []

    @posti.each do |post|
      tag = post.tag_titles.all[0]
      if tag.title == @tag.title
        @posts << post
      end
    end
    
  end
end
