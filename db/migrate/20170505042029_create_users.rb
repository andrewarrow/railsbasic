class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :flavor
      t.string :password
    end

    add_index :users, :email, unique: true
  end
end
