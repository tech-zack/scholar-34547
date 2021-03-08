class CreateScholars < ActiveRecord::Migration[6.0]
  def change
    create_table :scholars do |t|
      t.integer    :category_id, null: false
      t.string     :title,       null: false
      t.text       :text,        null: false
      t.references :user,        foregin_key: true
      t.timestamps
    end
  end
end
