class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items,:options=>'charset=utf8' do |t|
      t.references :product_cate
      t.string :title
      t.string :taobao_url
      t.text   :description
      t.string :tags
      t.string :big_image_path
      t.string :other_images
      t.string :shop_author
      t.string :shop_rate
      t.integer :shop_product_count
      t.date :shop_created_at
      t.string :shop_mobile_phone
      t.string :shop_tel_phone
      t.string :shop_email
      t.boolean :is_valid, :default => true
      
      t.timestamps
    end
    add_index :product_items, :product_cate_id
  end
end
