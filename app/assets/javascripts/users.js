$(document).ready(function() {
	var $dropdown_toggle = $(".dropdown-toggle").find("a"),
							$dropdown_menu = $(".dropdown-menu");
							$dropdown_toggle_form = $(".dropdown-toggle").find("form"),
							$dropdown_menu_form = $(".dropdown-menu-form"),
							$new_comment_link = $(".like_comment a:contains('comment')"),
							$live_tab = (".profile_nav .nav .live"),
							$all_tabs = $(".timeline_tab, .about_tab, .photos_tab, .friends_tab");
	// Handles notification and search dropdowns
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

	// Handles form dropdown for new comment on a post like|comment
	$new_comment_link.on('click', function() {
		$(this).parent().siblings("#new_comment").toggle();
	});

	// Handles nav bar tabs Timeline, Photos, etc.
	$all_tabs.hide();
	$("." + $(".live").text().toLowerCase() + "_tab").show();
	$(".profile_nav .nav li").on('click', function(e) {
		if (!$(this).hasClass("live")) {
			console.log("clicked");
			$all_tabs.hide();
			$(".live").removeClass("live");
			$(this).addClass("live")
			$("." + $(this).text().toLowerCase() + "_tab").show();
		}
	});
});