$(document).ready(function(){

	// Phone masking
	$('#phone').mask('(999) 999-9999', {placeholder:'x'});

	// Credit card masking
	$('#card_number').mask('9999-9999-9999-9999', {placeholder:'x'});

	// CVV2 masking
	$('#cvv2').mask('999', {placeholder:'x'});

	/***************************************/
	/* Form validation */
	/***************************************/
	$( '#j-forms' ).validate({

		/* @validation states + elements */
		errorClass: 'error-view',
		validClass: 'success-view',
		errorElement: 'span',
		onkeyup: false,
		onclick: false,

		/* @validation rules */
		rules: {
			name: {
				required: true
			},
			email: {
				required: true,
				email: true
			},
			phone: {
				required: true
			},
			country: {
				required: true
			},
			city: {
				required: true
			},
			address: {
				required: true
			},
			message: {
				required: true,
				minlength: 20
			},
			card_name: {
				required: true
			},
			card_number: {
				required: true
			},
			cvv2: {
				required: true
			},
			card_month: {
				required: true
			},
			card_year: {
				required: true
			}
		},
		messages: {
			name: {
				required: 'Please enter your name'
			},
			email: {
				required: 'Please enter your email',
				email: 'Incorrect email format'
			},
			phone: {
				required: 'Please enter your phone'
			},
			country: {
				required: 'Please select a country'
			},
			city: {
				required: 'Please field is required'
			},
			address: {
				required: 'Please enter your address'
			},
			message: {
				required: 'Please enter your message'
			},
			card_name: {
				required: 'Please enter name on card'
			},
			card_number: {
				required: 'Please enter a card number'
			},
			cvv2: {
				required: 'CVV code'
			},
			card_month: {
				required: 'Please select a month'
			},
			card_year: {
				required: 'Please select a year'
			}
		},
		// Add class 'error-view'
		highlight: function(element, errorClass, validClass) {
			$(element).closest('.input').removeClass(validClass).addClass(errorClass);
			if ( $(element).is(':checkbox') || $(element).is(':radio') ) {
				$(element).closest('.check').removeClass(validClass).addClass(errorClass);
			}
		},
		// Add class 'success-view'
		unhighlight: function(element, errorClass, validClass) {
			$(element).closest('.input').removeClass(errorClass).addClass(validClass);
			if ( $(element).is(':checkbox') || $(element).is(':radio') ) {
				$(element).closest('.check').removeClass(errorClass).addClass(validClass);
			}
		},
		// Error placement
		errorPlacement: function(error, element) {
			if ( $(element).is(':checkbox') || $(element).is(':radio') ) {
				$(element).closest('.check').append(error);
			} else {
				$(element).closest('.unit').append(error);
			}
		},
		// Submit the form
		submitHandler:function() {
			$( '#j-forms' ).ajaxSubmit({

				// Server response placement
				target:'#j-forms #response',
				
				// If error occurs
				error:function(xhr) {
					$('#j-forms #response').html('An error occured: ' + xhr.status + ' - ' + xhr.statusText);
				},

				// Before submiting the form
				beforeSubmit:function(){
					// Add class 'processing' to the submit button
					$('#j-forms button[type="submit"]').attr('disabled', true).addClass('processing');
				},

				// If success occurs
				success:function(){
					// Remove class 'processing'
					$('#j-forms button[type="submit"]').attr('disabled', false).removeClass('processing');

					// Remove classes 'error-view' and 'success-view'
					$('#j-forms .input').removeClass('success-view error-view');
					$('#j-forms .check').removeClass('success-view error-view');

					// If response from the server is a 'success-message'
					if ( $('#j-forms .success-message').length ) {

						// Reset form
						$('#j-forms').resetForm();

						// Prevent submitting the form while success message is shown
						$('#j-forms button[type="submit"]').attr('disabled', true);

						setTimeout(function(){
							// Delete success message after 5 seconds
							$('#j-forms #response').removeClass('success-message').html('');

							// Make submit button available
							$('#j-forms button[type="submit"]').attr('disabled', false);
						}, 5000);
					}
				}
			});
		}
	});
	/***************************************/
	/* end form validation */
	/***************************************/
});