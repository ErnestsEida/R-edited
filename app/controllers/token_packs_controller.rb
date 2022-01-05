
class TokenPacksController < ApplicationController
    before_action :require_token_pack, only: [:destroy, :edit, :update]
    before_action :is_admin?

    def create
      token_pack = TokenPack.new(token_pack_params)
      if token_pack.save
        flash[:notice] = "New token pack successfuly created!"
        redirect_to admin_manage_token_packs_path
      else
        flash[:alert] = "Error occured upon token pack creation!"
        redirect_to admin_manage_token_packs_path
      end
    end

    def update
      if @token_pack.update(token_pack_params)
        flash[:notice] = "Token pack succesfully updated!"
        redirect_to admin_manage_token_packs_path
      else
        flash[:alert] = "Token update unsuccessful!"
        render :edit
      end
    end

    def destroy
      if @token_pack.destroy
        flash[:notice] = "Token Pack successfuly removed!"
        redirect_to admin_manage_token_packs_path
      else
        flash[:alert] = "Error occured upon token pack deletion!"
        redirect_to admin_manage_token_packs_path
      end
    end

    private

    def token_pack_params
      params.require(:token_pack).permit(:title, :description, :price, :token_amount)
    end

    def require_token_pack
      @token_pack = TokenPack.find(params[:id])
    end

end
