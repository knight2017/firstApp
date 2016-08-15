class AddAauserReferencesToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :aauser, index: true, foreign_key: true
  end
end
