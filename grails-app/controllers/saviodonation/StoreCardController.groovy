package saviodonation



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StoreCardController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StoreCard.list(params), model:[storeCardInstanceCount: StoreCard.count()]
    }

    def show(StoreCard storeCardInstance) {
        respond storeCardInstance
    }

    def create() {
        respond new StoreCard(params)
    }

    @Transactional
    def save(StoreCard storeCardInstance) {
        if (storeCardInstance == null) {
            notFound()
            return
        }

        if (storeCardInstance.hasErrors()) {
            respond storeCardInstance.errors, view:'create'
            return
        }

        storeCardInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'storeCard.label', default: 'StoreCard'), storeCardInstance.id])
                redirect storeCardInstance
            }
            '*' { respond storeCardInstance, [status: CREATED] }
        }
    }

    def edit(StoreCard storeCardInstance) {
        respond storeCardInstance
    }

    @Transactional
    def update(StoreCard storeCardInstance) {
        if (storeCardInstance == null) {
            notFound()
            return
        }

        if (storeCardInstance.hasErrors()) {
            respond storeCardInstance.errors, view:'edit'
            return
        }

        storeCardInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StoreCard.label', default: 'StoreCard'), storeCardInstance.id])
                redirect storeCardInstance
            }
            '*'{ respond storeCardInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StoreCard storeCardInstance) {

        if (storeCardInstance == null) {
            notFound()
            return
        }

        storeCardInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StoreCard.label', default: 'StoreCard'), storeCardInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'storeCard.label', default: 'StoreCard'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
