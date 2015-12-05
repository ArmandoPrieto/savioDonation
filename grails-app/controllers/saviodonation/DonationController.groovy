package saviodonation
import grails.transaction.Transactional;
import savioDonation.Donation
import java.util.UUID;
@Transactional(readOnly = true)
class DonationController {
	def RBSService

    def index() { 
		
	
		
	}
	@Transactional
	def process(){
		UUID idOne = UUID.randomUUID();
		
		println params["first_name"]
		println params["last_name"]
		println params["email"]
		println params["phone"]
		println params["country"]
		println params["city"]
		println params["zipCode"]
		println params["address"]
		println params["cardType"]
		println params["card_name"]
		println params["card_number"]
		println params["cvv2"]
		println params["card_month"]
		println params["card_year"]
			withForm {
		if(params["monthly"]){
			Address address = new Address()
			address.setAddress(params["address"])
			address.setCity( params["city"])
			address.setCountry(params["country"])
			address.setState(params["state"])
			address.setZipCode(params["zipCode"])
			
			StoreCard storeCard = new StoreCard()
			storeCard.setNameOnCard(params["card_name"])
			storeCard.setCardId(params["card_number"])
			storeCard.setExpDate(params["card_month"]+params["card_year"].toString().substring(2))
			storeCard.setCardType(params["cardType"])
			
			CardHolder cardHolder = new CardHolder()
			cardHolder.setName(params["first_name"] +" "+params["last_name"] )
			cardHolder.setEmail(params["email"])
			cardHolder.setPhone(params["phone"])
		    cardHolder.address = address
			cardHolder.addToStoreCard(storeCard)
			int amount
			boolean process = true
			try{
			amount = Integer.parseInt(params["pamount"].toString())
			}catch(Exception e ){
				process = false				
			}
			
			if(amount<10){
				process = false
			}
			
			CardHolder.withTransaction{status ->
				if(cardHolder.save(flush:true ,failOnError: true) && process){
					//Monhtly transaction
					def date = new Date()+1
					int year = date[Calendar.YEAR]
					int month = date[Calendar.MONTH]+1
					int day = date.getAt(Calendar.DATE)
					boolean created = RBSService.create(cardHolder.id.toString(),
						storeCard.getCardId().replaceAll("-",""),
						storeCard.getExpDate(),
						address.getAddress(),
						address.getZipCode(),
						params["pamount"],
						day<10?("0"+day):(day.toString()),
						month<10?("0"+month):(month.toString()),
						year.toString().substring(2),
						"12")
						if(created){
							sendEmail(params["email"], "donation@saintdominicsavio.org",
								params["first_name"] + " "+params["last_name"],
								params["address"],
								params["city"],
								params["state"],
								params["zipCode"],
								params["country"],
								"Monthly donation",
								"12 months",
								params["pamount"],
								idOne.toString().substring(0, 8),
								new Date(),
								params["phone"]);
								
							render(view: "succes")
						}else{
								status.setRollbackOnly()
								render(view: "donationError")
						}
				}else{
					
					render(view: "donationError")
				}
			}
		}else{
			//Regular transaction
		
			Donation d = new Donation()
			boolean result =d.sale(
				params["first_name"],
				params["last_name"],
				params["address"],
				params["zipCode"],
				params["email"],
				params["phone"],
				params["card_number"].replaceAll("-",""), 
				params["card_month"]+params["card_year"].toString().substring(2), 
				params["cvv2"],
				params["pamount"],
				idOne.toString().substring(0, 8),
				"Savio Donation System")
			
			if(result){
				sendEmail(params["email"], "donation@saintdominicsavio.org",
					params["first_name"] + " "+params["last_name"],
					params["address"],
					params["city"],
					params["state"],
					params["zipCode"],
					params["country"],
					"One time donation",
					"N/A",
					params["pamount"],
					idOne.toString().substring(0, 8),
					new Date(),
					params["phone"]);
				render(view: "succes")
			}else{
					
					render(view: "donationError")
			}
		}
		
		
			
			
		
			
	 }.invalidToken {
		// bad request
	 		//render(view: "/error")
			 render(view: "donationError")
	 }
		
	
		
		
	}
	
	def emailTest(){
		
		sendEmail("prieto.arm@gmail.com", "donation@saintdominicsavio.org");
		
	}
	
	
	public void sendEmail(String tox, 
		String fromx,
		String name,
		String address,
		String city,
		String state,
		String zipCode,
		String country,
		String donationType,
		String period,
		String amount,
		String transactionNumber,
		Date date,
		String phone){
		
		try{
		sendMail {
			to tox
			from fromx
			subject "Thank you"
			html g.render(template:"emailInvoice", model: [name:name,
				address: address,
				city: city,
				state: state,
				zipCode: zipCode,
				country: country,
				donationType:donationType,
				period:period,
				amount: amount,
				transactionNumber: transactionNumber,
				date: date,
				phone: phone,
				email: tox]) 
		 }
		}catch(Exception e){
			e.printStackTrace()
			System.out0.println("Email sending error")
		}
		
		
		
	}

	
	def delete(){
		if(params.id){
			if(RBSService.inquire(params.id.toString())){
				if(RBSService.delete(params.id.toString())){
					render "The record costumerId: "+params.id+" was deleted"
				}else{
					render "The record costumerId: "+params.id+" was NOT deleted"
				}
			}else{
				render "The record costumerId: "+params.id+" does NOT exist"
			}
			
		}else{
			render "The costumerId is required"
		}
		
	}
	
	
	def update(){
		if(params.id){
			
			if(RBSService.inquire(params.id.toString())){
				if(RBSService.update(params.id.toString())){
					render "The record costumerId: "+params.id+" was updated"
				}else{
					render "The record costumerId: "+params.id+" was NOT updated"
				}
			}else{
				render "The record costumerId: "+params.id+" does NOT exist"
			}
		}else{
			render "The costumerId is required"
		}
	
	}
	def inquire(){
		
		if(params.id){
			if(RBSService.inquire(params.id.toString())){
				render "The record costumerId: "+params.id+" does exist"
			}else{
				render "The record costumerId: "+params.id+" does NOT exist"
			}
		}else{
			render "The costumerId is required"
		}
	}
}
