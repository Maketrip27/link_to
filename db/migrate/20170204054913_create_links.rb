class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.string	:title
    	t.string	:description
    	t.string	:url
    	t.integer	:link_type
    	t.belongs_to :user 
      t.timestamps null: false
    end
  end
end
