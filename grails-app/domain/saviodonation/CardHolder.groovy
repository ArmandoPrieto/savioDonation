package saviodonation

class CardHolder {
	
	
	String Name
	String email
	String phone
	static hasOne = [address: Address]
	static hasMany = [storeCard: StoreCard]
	
	
	static constraints = {
		email email: true
	}
   
}
