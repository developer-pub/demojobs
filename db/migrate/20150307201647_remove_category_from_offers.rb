class RemoveCategoryFromOffers < ActiveRecord::Migration
  def change
    remove_column :offers, :category, :integer
  end
end
