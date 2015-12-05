<%@ page contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="utf-8" />
  <!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
  <!--  All snippets are MIT license http://bootdey.com/license -->
  <title>Invoice receipt - saintdominicsavio.org</title>
  <meta content="width=device-width, initial-scale=1" name="viewport" />
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
 </head>
 <body>
  <div class="receipt-content" style="background: #ECEEF4;">
   <div class="container bootstrap snippet">
    <div class="row">
     <div class="col-md-12">
      <div class="invoice-wrapper" style="background: #FFF; border: 1px solid #CDD3E2; border-radius: 4px; box-shadow: 0px 0px 1px #CCC; margin-top: 40px; padding: 40px 40px 60px;">
       <div class="intro" style="color: #444; line-height: 25px;"> Hi <strong>${name}</strong>, <br /> This is the receipt for a donation of <strong>$${amount}.00</strong> (USD) to Saint Dominic Savio Church </div>
       <div class="payment-info" style="margin-top: 25px; padding-top: 15px;">
        <div class="row">
         <div class="col-sm-6"><span style="color: #A9B0BB;">Transaction No.</span> <strong style="color: #444; display: block; margin-top: 3px;">${transactionNumber}</strong></div>
         <div class="col-sm-6 text-right"><span style="color: #A9B0BB;">Payment Date</span> <strong style="color: #444; display: block; margin-top: 3px;">${date}</strong></div>
        </div>
       </div>
      
       <table style="border-collapse:collapse;width:100%; text-align: right;">
       <tr>
      	<td style="color: #A9B0BB; display: block;">Donor</td>
      	<td>Donation To</td>
      </tr>
      <tr>
      	<td><strong> ${name} </strong></td>
      	<td>St. Dominic Savio Church</td>
      </tr>
      <tr>
      	<td>${address}</td>
      	<td>13400 Bellflower Blvd </td>
      </tr>
      <tr>
      	<td>${city}</td>
      	<td>Bellflower</td>
      </tr>
      <tr>
      	<td>${state}</td>
      	<td>CA</td>
      </tr>
      <tr>
      	<td>${zipCode}</td>
      	<td>90706</td>
      </tr>
      <tr>
      	<td>${country}</td>
      	<td>USA</td>
      </tr>
      <tr>
      	<td>email: <a href="#" style="display: inline-block; margin-top: 5px;"> ${email} </a>, phone: ${phone}</td>
      	<td><a href="http://saintdominicsavio.org/" style="display: inline-block; margin-top: 5px;"> saintdominicsavio.org  </a></td>
      
      </tr>
       </table>
     
       <table style="border-collapse:collapse;width:100%; text-align: right;">
       		<tr style=" text-align: right;border-bottom: 2px solid #EBECEE; color: #A9B0BB; font-size: 13px; letter-spacing: .3px; padding-bottom: 4px;">
       			<th>Description</th>
       			<th>Period</th>
       			<th>Amount</th>
       		</tr>
       		<tr style=" text-align: right;border-bottom: 2px solid #EBECEE; margin-top: 8px; padding-bottom: 8px;">
       			<td>${donationType}</td>
       			<td>${period}</td>
       			<td style="color: #84868A; font-size: 16px; letter-spacing: 0.1px;">$${amount}.00 </td>
       		</tr>
       </table>
       <div class="line-items" style="margin-top: 40px;">
      
     
        <div class="total text-right" style="margin-top: 30px;">
         <p class="extra-notes" style="color: #7A7A7A; float: left; font-size: 13px; line-height: 20px; text-align: left; width: 40%;"><strong style="color: #454545; display: block; margin-bottom: 5px;">Extra Notes</strong> If you have any questions comments or concerns about this payment you can contact us to +1 562 920 7796 . </p>
         <div class="field" style="color: #555; font-size: 14px; margin-bottom: 7px;"> Subtotal <span style="color: #84868A; display: inline-block; font-size: 15px; margin-left: 20px; min-width: 85px;">$${amount}.00</span></div>
         <div class="field" style="color: #555; font-size: 14px; margin-bottom: 7px;"> Shipping <span style="color: #84868A; display: inline-block; font-size: 15px; margin-left: 20px; min-width: 85px;">$0.00</span></div>
         <div class="field" style="color: #555; font-size: 14px; margin-bottom: 7px;"> Discount <span style="color: #84868A; display: inline-block; font-size: 15px; margin-left: 20px; min-width: 85px;">0.0%</span></div>
         <div class="field grand-total" style="color: #555; font-size: 16px; font-weight: 500; margin-bottom: 7px; margin-top: 10px;"> Total <span style="color: #20A720; display: inline-block; font-size: 16px; margin-left: 20px; min-width: 85px;">$${amount}.00</span></div>
        </div>
        </div>
      </div>
      <div class="footer" style="color: #969CAD; font-size: 12px; margin-bottom: 110px; margin-top: 40px; text-align: center;"> Copyright &copy; 2015. Saint Dominic Savio Church. Powered by <a href="https://www.facebook.com/taptodesigns/?fref=ts" style="color: blue;">Tapto</a></div>
     </div>
    </div>
   </div>
  </div>
  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	
                       
                   
</script>
 </body>
</html>
