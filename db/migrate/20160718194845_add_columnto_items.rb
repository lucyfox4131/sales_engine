class AddColumntoItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :merchant, index: true, foreign_key: true 
  end
end
