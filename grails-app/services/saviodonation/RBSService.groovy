package saviodonation

import grails.transaction.Transactional
import savioDonation.Donation

@Transactional
class RBSService {

    def serviceMethod() {
		
		
	

    }
	
	def create(String custumerId, 
				String cardId, 
				String expDate, 
				String address, 
				String zipCode, 
				String amount, 
				String day, 
				String month, 
				String year,
				String paymentCount){
		
		Donation d = new Donation()
		
		return d.cardCreateRecord(custumerId,
									cardId,
									expDate,
									address,
									zipCode,
									amount,
									day,
									month,
									year,
									paymentCount)
	}
	
	def delete(String custumerId){
			Donation d = new Donation()
			return d.cardDeleteRecord(custumerId)
				
	}
	
	def update(String custumerId){
			Donation d = new Donation()
			def cardHolder = CardHolder.get(Integer.parseInt(custumerId))
			def date = new Date() + 5
			int year = date[Calendar.YEAR]
			int month = date[Calendar.MONTH]+1
			int day = date.getAt(Calendar.DATE)
			return d.cardUpdateRecord(custumerId,
				cardHolder.storeCard[0].cardId.replaceAll("-",""),
				cardHolder.storeCard[0].expDate,
				cardHolder.address.address,
				cardHolder.address.zipCode,
				params.amount?:"16.0",
				day<10?("0"+day):(day.toString()),
				month<10?("0"+month):(month.toString()),
				year.toString().substring(2),
				"12")
			
	}
	def inquire(String custumerId){
		
			Donation d = new Donation()
			return d.cardInquireRecord(custumerId)
				
	
	}
}
