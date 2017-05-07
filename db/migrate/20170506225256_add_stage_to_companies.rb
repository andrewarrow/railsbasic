class AddStageToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :stage, :integer
  end
end
