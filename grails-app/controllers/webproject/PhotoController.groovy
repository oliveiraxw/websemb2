package webproject

import authentication.User
import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class PhotoController {

    static allowedMethods = [all: "get", test: "get", show: "get", view: "get", upload: "post", delete: 'delete']
    static defaultAction = "all"

    PhotoService photoService
    UserService userService

    def all() {
        params.max = 5
        def photos = photoService.paginate(params)
        render(view: "allPhotos", model: [photos: photos, count: photos.totalCount])
    }

    def test() {
        def photos = photoService.all()
        render(view: "images", model: [photos: photos])
    }

    def show(Long id) {
        params.max = 5
        User user = userService.get(id)
        if (user) {
            def photos = photoService.show(params, user)
            render(view: "allPhotos", model: [photos: photos, count: photos.totalCount, id: user.id])
        } else {
            response.sendError(404)
        }

    }

    def view() {
        params.max = 5
        def user = userService.getCurrent()
        def photos = photoService.show(params, user)
        render(view: "allPhotos", model: [photos: photos, count: photos.totalCount])
    }

    def upload(Long id) {
        if (!id) {
            id = userService.getCurrent().id
        }
        photoService.upload(params, request, servletContext, userService.get(id))
        if (params.redirectAction == "show")
            redirect(action: params.redirectAction, params: [id: params.id])
        else
            redirect(action: params.redirectAction)
    }

    def delete(Long id) {
        def userId = photoService.delete(id, servletContext)
        if (params.redirectAction == "show")
            redirect(action: params.redirectAction, params: [id: userId])
        else
            redirect(action: params.redirectAction)
    }
}
