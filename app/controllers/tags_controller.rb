class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @communities = Community.joins(:tag_references).where(tag_references: { tag_id: @tag.id })
    @posts = Post.joins(:tag_references).where(tag_references: { tag_id: @tag.id })
  end
end
