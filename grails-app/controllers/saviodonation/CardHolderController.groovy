package saviodonation



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CardHolderController {
	def RBSService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		
		
        params.max = Math.min(max ?: 10, 100)
        respond CardHolder.list(params), model:[cardHolderInstanceCount: CardHolder.count()]
    }
	
	

    def show(CardHolder cardHolderInstance) {
        respond cardHolderInstance
    }

    def create() {
        respond new CardHolder(params)
    }

    @Transactional
    def save(CardHolder cardHolderInstance) {
        if (cardHolderInstance == null) {
            notFound()
            return
        }

        if (cardHolderInstance.hasErrors()) {
            respond cardHolderInstance.errors, view:'create'
            return
        }

        cardHolderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cardHolder.label', default: 'CardHolder'), cardHolderInstance.id])
                redirect cardHolderInstance
            }
            '*' { respond cardHolderInstance, [status: CREATED] }
        }
    }

    def edit(CardHolder cardHolderInstance) {
        respond cardHolderInstance
    }

    @Transactional
    def update(CardHolder cardHolderInstance) {
        if (cardHolderInstance == null) {
            notFound()
            return
        }

        if (cardHolderInstance.hasErrors()) {
            respond cardHolderInstance.errors, view:'edit'
            return
        }

        cardHolderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CardHolder.label', default: 'CardHolder'), cardHolderInstance.id])
                redirect cardHolderInstance
            }
            '*'{ respond cardHolderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CardHolder cardHolderInstance) {

        if (cardHolderInstance == null) {
            notFound()
            return
        }
		boolean isError = false
		CardHolder.withTransaction{status ->
			String auxId = cardHolderInstance.id.toString()
			
	        cardHolderInstance.delete(flush:true)
			
				if(RBSService.inquire(auxId) && !RBSService.delete(auxId)){
					status.setRollbackOnly()
					isError = true
				}
	        }
		
        request.withFormat {
            form multipartForm {
				if(!isError){
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'CardHolder.label', default: 'CardHolder'), cardHolderInstance.id])
                }else{
				flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'CardHolder.label', default: 'CardHolder'), cardHolderInstance.id])
				}
				redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	def forceDelete(){
		
		RBSService.delete(params.id)
		
		render "<h2>Record ${params.id} deleted</h2>"
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardHolder.label', default: 'CardHolder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
