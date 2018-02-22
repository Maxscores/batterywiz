class AddUserToInstallation < ActiveRecord::Migration[5.1]
  def change
    add_reference :installations, :user, index: true
  end
end
