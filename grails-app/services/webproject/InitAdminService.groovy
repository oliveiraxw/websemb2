package webproject

import authentication.Role
import authentication.User
import authentication.UserRole
import grails.transaction.Transactional
import grails.web.Action

@Transactional
class InitAdminService {

    def grailsApplication

    def init() {
        Role roleExist = Role.createCriteria().get {
            eq('authority', "ROLE_USER")
        }
        if (!roleExist) {

            new Role(authority: 'ROLE_USER').save(flush: true)

            def role = new Role(authority: 'ROLE_ADMIN').save(flush: true)

            def user = new User(username: 'admin', password: 'admin').save(flush: true)

            new UserRole(user: user, role: role).save(flush: true)

            grailsApplication.controllerClasses.find { it.name == "Login" }.each {
                controller ->
                    def newController = new Controller(name: controller.logicalPropertyName, fullName: controller.fullName, defaultAction: controller.defaultAction)
                    newController.addToRoutes(new Route(action: "index", httpMethod: "get"))
                    newController.addToRoutes(new Route(action: "denied", httpMethod: "get"))
                    newController.addToRoutes(new Route(action: "auth", httpMethod: "post"))
                    newController.save(flush: true)
            }

            new Route(action: "logoff", httpMethod: "get").save(flush: true)
            new Route(action: "dbconsole", httpMethod: "get").save(flush: true)

            grailsApplication.controllerClasses.findAll { it.name != "Login" && it.name != "Logout" }.each {
                controller ->
                    def newController = new Controller(name: controller.logicalPropertyName, fullName: controller.fullName, defaultAction: controller.defaultAction)
                    controller.clazz.each {
                        clazz ->
                            clazz.methods.each {
                                action ->
                                    def annotation = action.getAnnotation(Action)
                                    if (annotation) {
                                        Class[] argTypes = annotation.commandObjects()
                                        newController.addToRoutes(new Route(action: action.name, httpMethod: clazz.allowedMethods.get(action.name), argTypes: argTypes*.simpleName))
                                    }
                            }
                    }
                    newController.save(flush: true)
            }
        }
    }
}