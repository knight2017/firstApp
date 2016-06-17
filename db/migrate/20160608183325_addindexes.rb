class Addindexes < ActiveRecord::Migration
  def change

    add_index :questions, :title#, uniqu: true
    add_index :questions, :body
  end
end
