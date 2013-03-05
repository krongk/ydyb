#encoding: utf-8
ActiveAdmin.register ProductItem do
  menu :parent => "店铺信息"

  index do
    column :id
    column :title do |item|
      link_to item.title, admin_product_item_path(item)
    end
    column :taobao_url do |item|
      link_to(item.taobao_url, item.taobao_url, :target => '_blank')
    end
    column :is_valid
    column :updated_at
    default_actions
  end

  show do |item|
    div :class => 'panel' do
        h3 '店铺信息'
        div :class => 'panel_contents' do
            div :class =>"attributes_table product_cate", :id=>"attributes_table_product_cate_#{item.product_cate_id}" do
                table do
                  tr do
                    th '编号'
                    td item.id
                  end
                  tr do
                    th '店铺标题'
                    td item.title
                  end
                  tr do
                    th '淘宝链接'
                    td link_to(item.taobao_url, item.taobao_url, :target => '_blank')
                  end
                  tr do
                    th '案例图片'
                    td image_tag item.image_path1
                  end
                  tr do
                    th '标签'
                    td item.tags
                  end
                  tr do
                    th '更新时间'
                    td item.updated_at
                  end
                  tr do
                    th '案例详情'
                    td simple_format item.description
                  end
                end
            end
        end
    end
  end

end
