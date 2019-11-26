class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.integer :department_id
    end

    add_foreign_key :employees, :departments
  end
end
