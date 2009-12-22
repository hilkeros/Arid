// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	$('label.example').hide().each(function() {
		var label = $(this)
		var input = $('#' + label.attr('for'));
		var original_color = input.css('color')

		// Clear input when we get focus
		input.focus(function(e) {
			if (input.val() == label.html())
				input.css('color', original_color).val('')
		})

		// Reset the input when we lose focus
		input.blur(function(e) {
			if (input.val() == "")
				input.val(label.html()).css('color', 'gray')
		})

		// Clear input when the form is submitted
		input.parents('form').submit(function(e) {
			if (input.val() == label.html())
				input.val('')
		})

		input.blur();
	});
	
	$('div.signup').hide();
	
	$('a.signup_link').click(function(){
		$('div.login').hide();
		$('div.signup').appear();
	})
	
	$('a.login_link').click(function(){
		$('div.login').appear();
		$('div.signup').hide();
	})
})