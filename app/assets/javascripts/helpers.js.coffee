@create_buttonbar = (id,options) ->
	$(id+".buttonbar .button").each ->
		id_name=$(this).attr "name"
		if id_name == "btn_add"
			$(this).click ->
				window.location.href=options.add_url
		if id_name == "btn_refresh"
			$(this).click ->
				window.location.href=options.refresh_url
		if id_name == "btn_delete"
			$(this).click ->
				eval options.delete_func()


@management_buttonbar = (id) ->
	$(id+" UL LI INPUT.button").each ->
		btn_id=$(this).attr "id"
		console.log btn_id
		$("#"+btn_id).click ->
			btn_arr=null
			btn_arr=btn_id.split("_")
			btn_type=btn_arr[0]
			btn_type_id=btn_arr[1]
			console.log btn_type
			console.log btn_type_id
			alert btn_arr
			return false

@generate_collapsables = (id) ->
	$(id+" h2.collapsable").each ->
		$(this).css "cursor", "pointer"
		a=$('<span class="ui-icon"></span>').css("float","left")
		if ($(this).hasClass "hidden")
			a.addClass "ui-icon-triangle-1-e"
			a.removeClass "ui-icon-triangle-1-s"
		else
			a.removeClass "ui-icon-triangle-1-e"
			a.addClass "ui-icon-triangle-1-s"
		$(this).prepend(a)


		$(this).click ->
			if ($(this).parent().children(".collapse").hasClass "hidden")
				$(this).children(".ui-icon").addClass "ui-icon-triangle-1-s"
				$(this).children(".ui-icon").removeClass "ui-icon-triangle-1-e"

				$(this).parent().children(".collapse").show()
				$(this).parent().children(".collapse").removeClass "hidden"
			else
				$(this).children(".ui-icon").removeClass "ui-icon-triangle-1-s"
				$(this).children(".ui-icon").addClass "ui-icon-triangle-1-e"

				$(this).parent().children(".collapse").hide()
				$(this).parent().children(".collapse").addClass("hidden")

