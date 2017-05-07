class CompaniesUsersJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :user_companies do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :role
    end

    add_index :user_companies, :user_id
    add_index :user_companies, :company_id
  end
end
