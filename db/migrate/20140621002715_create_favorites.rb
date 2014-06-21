class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
