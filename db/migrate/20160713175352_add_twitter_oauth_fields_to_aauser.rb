class AddTwitterOauthFieldsToAauser < ActiveRecord::Migration
  def change
    add_column :aausers, :provider, :string
    add_column :aausers, :uid, :string
    add_column :aausers, :twitter_token, :string
    add_column :aausers, :twitter_secret, :string
    add_column :aausers, :twitter_raw_data, :text

    add_index :aausers, [:uid, :provider]
  end
end
