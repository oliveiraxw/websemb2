package webproject

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class RouteService {

    def all() {
        Route.createCriteria().list() {}
    }

    def paginate(GrailsParameterMap params) {
        Route.createCriteria().list(params) {}
    }

}
