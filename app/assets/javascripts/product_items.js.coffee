jQuery ->
	$(".product_item_show").bind 'click', (event) ->
		url = "/product_items/" + $(this).attr("id").replace("product_item_show_", "")
		#$("#product_item_on").html($.getScript(url))
		#$("#product_item_on").modal()

		# Display an external page using an iframe
		$.modal('<iframe src="' + url + '" height="680" width="980" style="border:0; overflow: hidden;">', {
			closeHTML:"x",
			containerCss:{
				backgroundColor:"#fff", 
				borderColor:"#fff", 
				padding:0, 
				margin:0
			},
			overlayClose:true
		})

  # $(".shop_dish_panel_menu_a").bind 'click', (event) ->
  #   shop_id = $(this).attr("id").replace("shop_dish_panel_menu_", "")
  #   $("#shop_dish_panel_" + shop_id).slideToggle(800)
  #   if $(this).text() == "展开菜单"
  #     $(this).html('<span class="ico_me">收起菜单</span>')
  #   else
  #     $(this).html('<span class="ico_me">展开菜单</span>')


