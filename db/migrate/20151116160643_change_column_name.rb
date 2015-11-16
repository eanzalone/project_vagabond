class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :neighborhood, :location
  end
end
