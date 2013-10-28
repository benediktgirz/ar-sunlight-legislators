class CreateRep < ActiveRecord::Migration

  

  def change
    create_table :reps do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :gender
      t.string :birthdate
      t.string :twitter_id
      t.string :in_office


    end
  end  
  
end
