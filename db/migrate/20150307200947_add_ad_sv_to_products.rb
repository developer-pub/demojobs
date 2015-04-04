class AddAdSvToProducts < ActiveRecord::Migration
  def change
    add_reference :offers, :category, index: true
    add_foreign_key :offers, :categories
  end
end
