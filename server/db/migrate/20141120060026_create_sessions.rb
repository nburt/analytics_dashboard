class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.json :response

      t.timestamps
    end
  end
end
