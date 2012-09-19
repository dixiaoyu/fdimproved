class CreateProcessings < ActiveRecord::Migration
  def change
    create_table :processings do |t|

      t.timestamps
    end
  end
end
