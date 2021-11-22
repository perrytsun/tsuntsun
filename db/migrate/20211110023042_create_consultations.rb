class CreateConsultations < ActiveRecord::Migration[6.1]
  def change
    create_table :consultations do |t|
      t.text :consultation_contents
      t.text :hashbody
      t.text :category
      t.integer :hope_answer
      t.string :image
      t.timestamps

    end
  end
end
