<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>St. Dominic Savio Donation</title>

	<!-- Your META here -->
	<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0" name="viewport">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="${resource(dir: 'j-folder/css', file: 'demo.css')}">
	<link rel="stylesheet" href="${resource(dir: 'j-folder/css', file: 'font-awesome.min.css')}">
	<link rel="stylesheet" href="${resource(dir: 'j-folder/css', file: 'j-forms.css')}">

	<!-- Scripts -->
	<script src="${resource(dir: 'j-folder/js', file: 'jquery.1.11.1.min.js')}"></script>
	<script src="${resource(dir: 'j-folder/js', file: 'jquery.maskedinput.min.js')}"></script>

	<!--[if lt IE 10]>
			<script src="j-folder/js/jquery.placeholder.min.js"></script>
		<![endif]-->

</head>
<body class="bg-pic">
	<div class="wrapper wrapper-640">

		<g:form  useToken="true" controller="donation" action="process" method="post" class="j-forms">
			<div class="header">
			
				<p>St. Dominic Savio Donations</p>
			</div>
			<!-- end /.header-->
			<div class="content">

				<div class="divider-text gap-top-20 gap-bottom-45">
					<span>Personal info</span>
				</div>

				<!-- start name -->
				<div class="j-row">
					<div class="span6 unit">
						<div class="input">
							<label class="icon-right" for="first_name">
								<i class="fa fa-user"></i>
							</label>
							<input type="text" id="first_name" name="first_name" placeholder="First name">
						</div>
					</div>
					<div class="span6 unit">
						<div class="input">
							<label class="icon-right" for="last_name">
								<i class="fa fa-user"></i>
							</label>
							<input type="text" id="last_name" name="last_name" placeholder="Last name">
						</div>
					</div>
				</div>
				<!-- end name -->

				<!-- start email phone -->
				<div class="j-row">
					<div class="span6 unit">
						<div class="input">
							<label class="icon-right" for="email">
								<i class="fa fa-envelope-o"></i>
							</label>
							<input type="email" placeholder="Email" id="email" name="email">
						</div>
					</div>
					<div class="span6 unit">
						<div class="input">
							<label class="icon-right" for="phone">
								<i class="fa fa-phone"></i>
							</label>
							<input type="text" placeholder="Phone" id="phone" name="phone">
						</div>
					</div>
				</div>
				<!-- end email phone -->

				<div class="divider-text gap-top-20 gap-bottom-45">
					<span>Address</span>
				</div>
				<!-- start address -->
				<div class="unit">
					<div class="input">
						<label class="icon-right" for="address">
							<i class="fa fa-building-o"></i>
						</label>
						<input type="text" id="address" placeholder="Address" name="address">
					</div>
				</div>
				<!-- end address -->
				

				<!-- start city post code -->
				<div class="j-row">
					<div class="span5 unit">
						<div class="input">
							<label class="icon-right" for="city">
								<i class="fa fa-building-o"></i>
							</label>
							<input type="text" id="city" placeholder="City" name="city">
						</div>
					</div>
					<div class="span3 unit">
						<div class="input">
							<label class="icon-right" for="state">
								<i class="fa fa-building-o"></i>
							</label>
							<input type="text" id="state" placeholder="State" name="state">
						</div>
					</div>
					<div class="span4 unit">
						<div class="input">
							<label class="icon-right" for="zipCode">
								<i class="fa fa-bookmark-o"></i>
							</label>
							<input type="text" id="zipCode" placeholder="Post code" name="zipCode">
						</div>
					</div>
				</div>
				<!-- end city post code -->
				<!-- start country -->
				<div class="unit">
					<label class="input select">
						<select name="country">
							<option value="none">Select country</option>
							<option value="Australia">Australia</option>
							<option value="Austria">Austria</option>
							<option value="Brazil">Brazil</option>
							<option value="Canada">Canada</option>
							<option value="Germany">Germany</option>
							<option value="India">India</option>
							<option value="Italy">Italy</option>
							<option value="Japan">Japan</option>
							<option value=">Netherlands">Netherlands</option>
							<option value=">New Zealand">New Zealand</option>
							<option value="Philippines">Philippines</option>
							<option value="Portugal">Portugal</option>
							<option value="South Africa">South Africa</option>
							<option value="Spain">Spain</option>
							<option value="Switzerland">Switzerland</option>
							<option value="Sweden">Sweden</option>
							<option value="Turkey">Turkey</option>
							<option value="United Arab Emirates">United Arab Emirates</option>
							<option value="United Kingdom">United Kingdom</option>
							<option value="USA">USA</option>
						</select>
						<i></i>
					</label>
				</div>
				<!-- end country -->
				

				<div class="divider-text gap-top-45 gap-bottom-45">
					<span>Payment info</span>
				</div>
				<!-- start inline radio -->
				<div class="unit">
					<div class="inline-group">
						<label class="label">Donation amount</label>
						<label class="radio">
							<input type="radio" name="i-radio" checked="" class='i-radio' value="10">
							<i></i>
							10
						</label>
						<label class="radio">
							<input type="radio" name="i-radio" class='i-radio' value="20">
							<i></i>
							20
						</label>
						<label class="radio">
							<input type="radio" name="i-radio" class='i-radio' value="50">
							<i></i>
							50
						</label>
						<label class="radio">
							<input type="radio" name="i-radio" class='i-radio' value="100">
							<i></i>
							100
						</label>
						<label class="radio">
							<input type="radio" name="i-radio" class='i-radio' value="Other">
							<i></i>
							Other
						</label>
						
					</div>
				</div>
				<!-- end inline radio -->

				<div class="unit">
						<div class="widget left-50 right-50">
							<div class="input">
								<input type="text" id="pamount" name="pamount" placeholder="donation amount" >
							</div>
							<label class="addon adn-50 adn-left" for="pamount">
								<i class="fa fa-usd"></i>
							</label>
							<label class="addon adn-50 adn-right" for="pamount">
								.00
							</label>
						</div>
				</div>
				<!-- start link -->
				<div class="unit">
					<label class="checkbox">
						<input type="checkbox" name="monthly">
						<i></i>
						Do you want to make this a monthly donation?
					</label>
				</div>
				<!-- end link -->
				<!-- start payment -->
				<div class="unit">
					<div class="inline-group">
						<label class="radio">
							<input type="radio" name="cardType" value="MasterCard" checked="">
							<i></i>
							MasterCard
						</label>
						<label class="radio">
							<input type="radio" name="cardType" value="Visa">
							<i></i>
							Visa
						</label>
						
					</div>
				</div>
				
				

				<!-- end payment -->

				<!-- start card info -->
				<div class="unit">
					<div class="input">
						<label class="icon-right" for="card_name">
							<i class="fa fa-user"></i>
						</label>
						<input type="text" id="card_name" placeholder="Name on card" name="card_name">
						<span class="tooltip-image tooltip-right-top"><img src="j-folder/img/name.jpg" /></span>
					</div>
				</div>
				<!-- end card info -->

				<!-- start card number + cvv2 -->
				<div class="j-row">
					<div class="span9 unit">
						<div class="input">
							<label class="icon-right" for="card_number">
								<i class="fa fa-credit-card"></i>
							</label>
							<input type="text" id="card_number" name="card_number" placeholder="Card number">
							<span class="tooltip-image tooltip-right-top"><img src="j-folder/img/number.jpg" /></span>
						</div>
					</div>
					<div class="span3 unit">
						<div class="input">
							<label class="icon-right" for="cvv2">
								<i class="fa fa-unlock"></i>
							</label>
							<input type="text" id="cvv2" name="cvv2" placeholder="CVV2">
							<span class="tooltip-image tooltip-right-top"><img src="j-folder/img/cvv.jpg" /></span>
						</div>
					</div>
				</div>
				<!-- end card number + cvv2 -->

				<!-- start expirity date -->
				<div class="j-row">
					<div class="span4">
						<label class="label label-center">Expires End</label>
					</div>
					<div class="span4 unit">
						<label class="input select">
							<select name="card_month">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<span class="tooltip-image tooltip-left-side"><img src="j-folder/img/month.jpg" /></span>
							<i></i>
						</label>
					</div>
					<div class="span4 unit">
						<label class="input select">
							<select name="card_year">
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
							</select>
							<span class="tooltip-image tooltip-right-side"><img src="j-folder/img/year.jpg" /></span>
							<i></i>
						</label>
					</div>
				</div>
				<!-- end expirity date -->

				<button type="submit" class="primary-btn">Continue</button>
				<button type="reset" class="secondary-btn">Reset</button>

			</div>
			<!-- end /.content -->
		
		</g:form>
	</div>
	
	<script>
		$(document).ready(function(){
			
			
			$('#pamount').val("10");

			$('.i-radio').click(function(){
				if($(this).val()!="Other"){
					$('#pamount').val($(this).val());

				}else{
					$('#pamount').val("");
					$('#pamount').focus();
				}
			
			});

			// Phone masking
			$('#phone').mask('(999) 999-9999', {placeholder:'x'});

			// Post code masking
			$('#post').mask('99999', {placeholder:'x'});

			// Credit card masking
			$('#card_number').mask('9999-9999-9999-9999', {placeholder:'x'});

			// CVV2 masking
			$('#cvv2').mask('999', {placeholder:'x'});

		});
	</script>
</body>
</html>