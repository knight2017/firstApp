class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      #will create a qestion_id
      #the index: true will automatically add an index on the question_id field b/c we are likly to going to use it in a queries the FK ture will auto add a foreign_key contraint on the question_id field references the 'id' field in the questio table.
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
