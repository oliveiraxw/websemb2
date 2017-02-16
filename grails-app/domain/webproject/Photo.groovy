package webproject

import authentication.User

class Photo {

    String name
    static belongsTo = [user: User]
    static constraints = {

    }
}
