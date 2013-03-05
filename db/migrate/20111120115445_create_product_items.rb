class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items,:options=>'charset=utf8' do |t|
      t.references :product_cate
      t.string :title
      t.string :taobao_url
      t.text   :description
      t.string :tags
      t.string :image_path1
      t.string :image_path2
      t.string :image_path3
      t.boolean :is_valid, :default => true
      
      t.timestamps
    end
    add_index :product_items, :product_cate_id
  end
end
