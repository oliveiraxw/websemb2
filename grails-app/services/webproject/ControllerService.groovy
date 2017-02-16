package webproject

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ControllerService {


    def all() {
        Controller.createCriteria().list() {}
    }

    def paginate(GrailsParameterMap params) {
        Controller.createCriteria().list(params) {}
    }
}
