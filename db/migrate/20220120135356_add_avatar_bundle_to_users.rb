class AddAvatarBundleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_bundle, :json, default: { hat: { hatType: "none", hatSize: "10", hatColor: "#666666" }, face: { faceType: "smile", faceSize: "10", faceColor: "#666666" }, shirt: { shirt_on: false, shirtColor: "#666666" } }
  end
end
