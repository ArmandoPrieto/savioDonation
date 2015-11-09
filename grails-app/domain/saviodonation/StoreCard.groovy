package saviodonation

class StoreCard {
	
	String nameOnCard
	String cardId
	String expDate //MMYY
	String cardType
	static belongsTo = [cardHolder: CardHolder]
    static constraints = {
    }
}
