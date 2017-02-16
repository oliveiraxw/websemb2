package webproject

class Controller {

    String name
    String fullName
    String defaultAction

    static hasMany = [routes: Route]

    static constraints = {
        name blank: false, unique: true
        fullName blank: false, unique: true
        defaultAction blank: false
    }
}
