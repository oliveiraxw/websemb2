package webproject

import authentication.User
import grails.plugin.springsecurity.annotation.Secured


@Secured('ROLE_ADMIN')
class UserController {

    static allowedMethods = [all: "get", create: "get", save: "post", edit: "get", update: "put", lastAccess: "put", delete: 'delete', profile: "get", editProfile: "get"]
    static defaultAction = "all"

    UserService userService
    PhotoService photoService

    def all() {
        params.max = 5
        def users = userService.paginate(params)
        render(view: "allUsers", model: [users: users, count: users.totalCount])
    }

    def create() {
        render(view: "createForm")
    }

    def save() {
        def exist = userService.existUser(params)
        if (exist) {
            flash.message = "User already exists with the username ${params.username}"
            redirect(action: "create")
        } else if (params.get("password") != params.get("confirmPassword")) {
            flash.message = "Passwords do not match"
            redirect(action: "create")
        } else {
            User user = userService.save(params)
            photoService.upload(params, request, servletContext, user)
            redirect(action: "all")
        }
    }

    def edit(Long id) {
        def user = userService.get(id)
        if (user)
            render(view: "editForm", model: [user: user])
        else
            response.sendError(404)
    }

    def update(Long id) {
        User user = userService.get(id)
        def exist = userService.existUser(params)
        if (exist && exist.username != user.username) {
            flash.message = "User already exists with the username ${params.username}"
            redirect(action: "edit", model: [user: user], params: [id: user.id])
        } else if (params.get("password") != params.get("confirmPassword")) {
            flash.message = "Passwords do not match"
            redirect(action: "edit", model: [user: user], params: [id: user.id])
        } else {
            def usernameOld = user.username
            userService.update(user, params)
            photoService.update(usernameOld, user, servletContext)
            if (userService.getCurrent().username == user.username) {
                redirect(action: "profile")
            } else {
                redirect(action: "all")
            }
        }
    }

    def lastAccess(Long id) {
        User user = userService.get(id)
        userService.updateLastAccess(user)
        redirect(action: "all")
    }

    def delete(Long id) {
        User user = userService.get(id)
        photoService.deleteAll(user, servletContext, true)
        userService.delete(id)
        redirect(action: "all")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def profile() {
        def photos = photoService.all()
        if (photos) {
            def firstPhoto = photos.first()
            render(view: "profile", model: [photos: photos, first: firstPhoto])
        } else {
            render(view: "profile")
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def editProfile() {
        def user = userService.getCurrent()
        render(view: "editForm", model: [user: user])

    }


}
