$(function(){
	$("#welcome-line-1").fitText(1, { minFontSize: '17px', maxFontSize: '112px' });
	$("#welcome-line-2").fitText(2, { minFontSize: '17px', maxFontSize: '56px' });
	$("#description").fitText(3, { minFontSize: '6px', maxFontSize: '24px' });
	$(".header-h1").fitText(1, {minFontSize: '17px', maxFontSize: '63px'});
	$(".header-lead").fitText(2, {minFontSize: '6px', maxFontSize: '42px'});
	
	$("#intro-down").on("click", 
		function(){
			$('html, body').animate({
				scrollTop: $("#why").offset().top
			}, 500);
		});
	$("#why-down").on("click", 
		function(){
			$('html, body').animate({
				scrollTop: $("#services").offset().top
			}, 500);
		});
	$("#services-down").on("click", 
		function(){
			$('html, body').animate({
				scrollTop: $("#go").offset().top
			}, 500);
		});

	$(window).scroll(function() {
		if($(window).scrollTop() + $(window).height() > $(window).height()) {
			$("#announcements").addClass('animated fadeOutLeft');
		}
		else {
			$("#announcements").removeClass('fadeOutLeft');
		}
		if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			$("#cta").addClass('animated fadeOutUp');
		}
		else {
			$("#cta").removeClass('fadeOutUp');
		}
	});
});