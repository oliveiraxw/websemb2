package webproject

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class RouteController {

    static allowedMethods = [all: "get", controllers: "get"]
    static defaultAction = "all"

    RouteService routeService
    ControllerService controllerService

    def all() {
        params.max = 5
        def routes = routeService.paginate(params)
        render(view: "allRoutes", model: [routes: routes, count: routes.totalCount])
    }

    def controllers() {
        params.max = 5
        def controllers = controllerService.paginate(params)
        render(view: "allControllers", model: [controllers: controllers, count: controllers.totalCount])
    }
}
