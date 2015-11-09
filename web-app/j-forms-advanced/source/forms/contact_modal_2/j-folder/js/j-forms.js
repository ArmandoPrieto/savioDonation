$(document).ready(function(){

	/***************************************/
	/* Modal form */
	/***************************************/
	// Demo modal forms
	$('.modal-open').on('click', function() {

		// Set background
		if( !$('.modal-fill').length ) {
			$('body').append('<div class="modal-fill"></div>');
		}

		// Show modal form and background
		$modalForm = $($(this).attr('href'));
		$('.modal-fill').fadeIn();
		$modalForm.css('display', 'block').css('top', '50%').css('margin-top', -$modalForm.outerHeight()/2).fadeIn();

		return false;
	});

	// Close button
	$('.modal-close').on('click', function() {
		$('.modal-form').fadeOut();
		$('.modal-fill').fadeOut();
		return false;
	});
	/***************************************/
	/* end modal form */
	/***************************************/

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
			subject: {
				required: true
			},
			message: {
				required: true,
				minlength: 20
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
			subject: {
				required: 'Please enter your subject'
			},
			message: {
				required: 'Please enter your message'
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
							// Delete success message after 3 seconds
							$('#j-forms #response').removeClass('success-message').html('');

							// Make submit button available
							$('#j-forms button[type="submit"]').attr('disabled', false);

							// Close modal form
							$('.modal-form').fadeOut();

							// Hide background
							$('.modal-fill').fadeOut();
						}, 3000);
					}
				}
			});
		}
	});
	/***************************************/
	/* end form validation */
	/***************************************/
});