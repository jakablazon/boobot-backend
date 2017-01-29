class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
    	t.text :access_token
      	t.text :team_name
      	t.text :channel
      	t.text :channel_id
      	t.text :team_id 
      	t.timestamps
    end
  end
end
