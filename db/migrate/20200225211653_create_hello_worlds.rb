class CreateHelloWorlds < ActiveRecord::Migration[6.0]
  def change
    create_table :hello_worlds do |t|
      t.string :name

      t.timestamps
    end
  end
end
