#encoding: utf-8
class HomeController < ApplicationController
  include ApplicationHelper
  def index
  	@product_cates = ProductCate.where(:is_valid => true)
    if params[:cate]
      @product_cate = ProductCate.where(:en_name => params[:cate]).first
    end

    if @product_cate
      @hot_product_items = ProductItem.where(:is_valid => true).where(:product_cate_id => @product_cate.id).paginate(:page => params[:page] || 1, :per_page => 40)
    else
      if site = Site.find_by_name("product sort ids")
        @hot_product_items = ProductItem.where(:is_valid => true).where("id in (#{site.value})").paginate(:page => params[:page] || 1, :per_page => 40)
      else
        @hot_product_items = ProductItem.where(:is_valid => true).paginate(:page => params[:page] || 1, :per_page => 40)
      end
    end
  end

  #It's a location tip, you can set lawyer => nil, and modify 'views/home/location.html.erb' to 'view/home/_location.html.erb'
  def location
  	#@ip = request.remote_id
  	@ip = '118.113.226.34'
  	@location = Rails.cache.read(@ip)
  end

  
  def sitemap
    static_urls = [ 
      {:type => 'static', :title => '联系我们', :url => '/contact',      :updated_at => Time.now},
      {:type => 'static', :title     => '关于我们', :url       => '/about',       :updated_at => Time.now},
      {:type => 'static', :title     => '搜索', :url       => '/search',      :updated_at => Time.now} ] 
      @pages_to_visit = static_urls
      @pages_to_visit += Page.all.collect{|a| {:type => 'page', :title => a.title, :url => page_path(a) ,  :updated_at => I18n.l(a.updated_at || Time.now, :format => :w3c)} }
      @pages_to_visit += NewsCate.all.collect{|a| {:type => 'news_cate', :title => a.name, :url => news_cate_path(a) ,  :updated_at => I18n.l(Time.now, :format => :w3c)} }
      @pages_to_visit += NewsItem.limit(20).collect{|a| {:type => 'news_item', :title => a.title, :url => news_item_path(a) ,  :updated_at => I18n.l(a.updated_at || Time.now, :format => :w3c)} }
      @pages_to_visit += ProductCate.all.collect{|a| {:type => 'product_cate', :title => a.name, :url => product_cate_path(a) ,  :updated_at => I18n.l(Time.now, :format => :w3c)} }
      @pages_to_visit += ProductItem.limit(20).collect{|a| {:type => 'product_item', :title => a.title, :url => product_item_path(a) ,  :updated_at => I18n.l(a.updated_at || Time.now, :format => :w3c)} }
      @pages_to_visit += ProjectCate.all.collect{|a| {:type => 'project_cate', :title => a.name, :url => project_cate_path(a) ,  :updated_at => I18n.l(Time.now, :format => :w3c)} }
      @pages_to_visit += ProjectItem.limit(20).collect{|a| {:type => 'project_item', :title => a.title, :url => project_item_path(a) ,  :updated_at => I18n.l(a.updated_at || Time.now, :format => :w3c)} }

    respond_to do |format|
      format.xml
      format.html
    end
  end

end
