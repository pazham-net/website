class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title_en
      t.string :title_ml
      t.string :title_manglish

      t.string :slug_en
      t.string :slug_ml
      t.string :slug_manglish

      t.text :content_en
      t.text :content_ml
      t.text :content_manglish

      t.string :medias

      t.timestamps
    end
  end
end
