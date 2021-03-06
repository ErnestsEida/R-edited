class Admin::AwardsController < ApplicationController
  before_action :load_award, only: [:update, :destroy]

  def create
    @awards = Award.all
    @award = Award.new(awards_params)
    if @award.save
      flash[:notice] = "Successfully created an award!"
      redirect_to admin_awards_path
    else
      render admin_awards_path
    end
  end

  def update
    new_value = params[:value]
    @award.update(value: new_value)
  end

  def destroy
    if @award.destroy
      flash[:notice] = "Award successfully deleted!"
    else
      flash[:alert] = "Error occured on award deletion!"
    end
    redirect_to admin_awards_path
  end

  private

  def load_award
    @award = Award.find(params[:id])
  end

  def awards_params
    params.require(:award).permit(:title, :value, :image)
  end
end
