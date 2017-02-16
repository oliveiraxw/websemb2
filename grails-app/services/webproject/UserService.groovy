package webproject

import authentication.User
import authentication.Role
import authentication.UserRole
import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap


@Transactional
class UserService {

    def springSecurityService

    def all() {
        User.createCriteria().list() {}
    }

    def existUser(GrailsParameterMap params) {
        User.createCriteria().get {
            eq("username", params.username)
        }
    }

    def paginate(GrailsParameterMap params) {
        User.createCriteria().list(params) {}
    }

    def get(Long id) {
        User.get(id)
    }

    def getCurrent() {
        springSecurityService.currentUser
    }

    def save(GrailsParameterMap params) {
        User user = new User()
        user.username = params.username
        user.password = params.password
        user.save(flush: true)
        Role role = Role.createCriteria().get {
            eq('authority', "ROLE_USER")
        }
        def userRole = new UserRole(user: user, role: role)
        userRole.save(flush: true)
        user
    }

    def update(User user, GrailsParameterMap params) {
        user.username = params.username
        if (params.password)
            user.password = params.password
        user.save(flush: true)
        if (getCurrent().username == user.username) {
            springSecurityService.reauthenticate(user.username)
        }
    }

    def updateLastAccess(User user) {
        user.lastAccess = new Date()
        user.save(flush: true)
    }

    def delete(Long id) {
        User.get(id).delete(flush: true)
    }

}
