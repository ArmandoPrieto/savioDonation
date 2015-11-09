package saviodonation

class Address {
	
	 
	
	String address
	String zipCode
	String city
	String state
	String country
	
	static belongsTo = [cardHolder: CardHolder]

    static constraints = {
    }
}
