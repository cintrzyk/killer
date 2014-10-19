class CreateAssassins < ActiveRecord::Migration
  def change
    create_table :assassins do |t|
      t.string :name

      t.timestamps
    end
  end
end
