class CreateQuestions < ActiveRecord::Migration
## add / remove tables/ cols /and indexs


  def change
    create_table :questions do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
