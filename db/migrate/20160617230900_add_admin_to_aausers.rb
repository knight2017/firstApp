class AddAdminToAausers < ActiveRecord::Migration
  def change
      add_column :aausers, :is_admin, :boolean, default: false
  end
end
