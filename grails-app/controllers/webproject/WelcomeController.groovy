package webproject

import grails.plugin.springsecurity.annotation.Secured

@Secured("IS_AUTHENTICATED_FULLY")
class WelcomeController {

    static allowedMethods = [index: "get"]

    def index() {

    }
}
