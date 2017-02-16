package webproject

class Route {

    String action
    String httpMethod
    String[] argTypes

    static belongsTo = [controller: Controller]

    static constraints = {
        action blank: false
        httpMethod blank: false
        argTypes nullable: true
        controller nullable: true
    }
}
