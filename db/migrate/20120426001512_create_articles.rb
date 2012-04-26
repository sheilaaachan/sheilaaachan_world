class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.boolean :active

      t.timestamps
    end
  end
end
