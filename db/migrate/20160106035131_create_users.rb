class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname	
  		t.string :username
  		t.string :email
  		t.string :password
  		t.string :birthdate
  		t.timestamps null: false
  	end	

  end
end
