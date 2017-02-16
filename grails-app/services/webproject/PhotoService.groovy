package webproject

import authentication.User
import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest

@Transactional
class PhotoService {

    def all() {
        Photo.createCriteria().list() {}
    }

    def paginate(GrailsParameterMap params) {
        Photo.createCriteria().list(params) {}
    }

    def show(GrailsParameterMap params, User user) {
        Photo.createCriteria().list(params) {
            eq("user.id", user.id)
        }
    }

    def upload(GrailsParameterMap params, HttpServletRequest request, ServletContext servletContext, User user) {
        def files = request.multiFileMap.photos
        if (!params.photos.isEmpty()) {
            def storagePath = servletContext.getRealPath("images/${user.username}")
            def storageDir = new File(storagePath)
            if (!storageDir.exists()) {
                storageDir.mkdirs()
            }
            files.each {
                file ->
                    def name = file.originalFilename + "-" + new Date().getTime()
                    file.transferTo(new File("${storagePath}/${name}"))
                    def photo = new Photo()
                    photo.name = name
                    user.addToPhotos(photo)
            }
        }
    }

    def update(String usernameOld, User user, ServletContext servletContext) {
        def storagePath = servletContext.getRealPath("images/${usernameOld}")
        def storageDir = new File(storagePath)
        def storageDirUpdate = servletContext.getRealPath("images/${user.username}")
        storageDir.renameTo(storageDirUpdate)
    }

    def delete(Long id, ServletContext servletContext) {
        def photo = Photo.get(id)
        photo.delete(flush: true)
        def user = photo.user
        def storagePath = servletContext.getRealPath("images/${user.username}/${photo.name}")
        def storageFile = new File(storagePath)
        storageFile.delete()
        deleteAll(user, servletContext, false)
        user.id
    }

    def deleteAll(User user, ServletContext servletContext, boolean deleteDir) {
        def storagePath = servletContext.getRealPath("images/${user.username}")
        def storageDir = new File(storagePath)
        if ((storageDir.list() as List).isEmpty() || deleteDir) {
            storageDir.deleteDir()
        }
    }
}
