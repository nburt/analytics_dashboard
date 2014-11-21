class CreateBounceRates < ActiveRecord::Migration
  def change
    create_table :bounce_rates do |t|
      t.json :response

      t.timestamps
    end
  end
end
