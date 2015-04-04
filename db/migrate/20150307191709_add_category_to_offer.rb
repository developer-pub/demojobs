class AddCategoryToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :category, :integer
  end
end
