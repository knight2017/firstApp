class AddAauserToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :aauser, index: true, foreign_key: true
  end
end
