class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
