class AddSlugToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slug, :string, limit: 100

    add_index :users, :slug, unique: true
  end
end
