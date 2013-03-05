#encoding: utf-8
ActiveAdmin.register ProductCate do
  menu :label => '店铺信息', :priority  => 4
  menu :label => "店铺分类", :parent => "店铺信息"

  sidebar :"帮助中心" do
  	ul do
  	  li "本页保存店铺列表的分类信息！"
  	end
  end
end