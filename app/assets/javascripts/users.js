
$(document).ready(function() {
	var $input = $('input');
	var $search_results = $('#search_results')
	var $notifications = $("#notifications")
	$input.on('click', function() {
		$search_results.slideDown(function() {

		});
	});

	$(".user_wrapper").on('click', function() {
		$search_results.slideUp();
		$notifications.slideUp();
	});

	$("#notification_link").on('click', function() {
		$notifications.slideDown();
	});
	
});