class AddCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.string :website
      t.string :flavor
      t.string :description
      t.integer :creator_id

      t.timestamps
    end

    add_index :companies, :slug, unique: true
  end
end
