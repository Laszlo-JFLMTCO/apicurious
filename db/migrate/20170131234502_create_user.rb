class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string    :reddit_id
      t.string    :name
      t.string    :token
      
      t.timestamps null:false
    end
  end
end
