class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|

    	t.text :itemType
      	t.text :url
      	t.timestamps
    end
  end
end
