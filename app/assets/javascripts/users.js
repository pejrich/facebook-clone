$(document).ready(function() {
	var $dropdown_toggle = $(".dropdown-toggle").find("a"),
							$dropdown_menu = $(".dropdown-menu");
							$dropdown_toggle_form = $(".dropdown-toggle").find("form"),
							$dropdown_menu_form = $(".dropdown-menu-form");
	$dropdown_toggle.on("click", function(e){
		var target = $( event.target );
		if (target.is("a")) {
			var href = $(this).attr('href');
			if ( href !== undefined ) {
	      		window.location.href = href;
      		}
		}
		$dropdown_menu.slideDown();
		$(document).on('click', function(e) {
			$dropdown_menu.slideUp();
		});
	})

	$dropdown_toggle_form.on("click", function(){
		$dropdown_menu_form.slideDown();
		$(document).on('click', function(e) {
			$dropdown_menu_form.slideUp();
		});
	})	
	
});