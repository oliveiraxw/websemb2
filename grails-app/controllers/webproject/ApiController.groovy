package webproject

import authentication.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ApiController {
    static allowedMethods = [lastAccess: "post"]

    UserService userService

    def lastAccess() {
        def message = [:]
        User user = userService.existUser(params)
        if (user) {
            userService.updateLastAccess(user)
            message["mensagem"] = "ultimo acesso do usuario ${user.username} atualizado com sucesso!"
        }
        else{
            message["mensagem"] = "usuario ${params.username} nao existe!"
        }
        render(message as JSON)
    }
}
