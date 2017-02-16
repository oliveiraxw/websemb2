package webproject

class BootStrap {

    InitAdminService initAdminService
    def init = { servletContext ->
        initAdminService.init()
    }
    def destroy = {
    }
}
