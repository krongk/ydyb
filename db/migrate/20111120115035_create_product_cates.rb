class CreateProductCates < ActiveRecord::Migration
  def change
    create_table :product_cates,:options=>'charset=utf8' do |t|
      t.string :name
      t.string :en_name
      t.text :note
      t.boolean :is_valid, :default => true
    end
  end
end
