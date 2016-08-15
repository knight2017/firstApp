class AddApiKeyToAausers < ActiveRecord::Migration
  def change
    add_column :aausers, :api_key, :string
    add_index  :aausers, :api_key, unique: true
  end
end
