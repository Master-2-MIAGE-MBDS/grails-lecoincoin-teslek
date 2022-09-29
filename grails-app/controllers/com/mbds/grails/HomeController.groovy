package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_ADMIN','ROLE_USER', 'ROLE_MODO'])
class HomeController {

    def index() {
        List<User> users = User.findAll()
        List<Annonce> annonces = Annonce.findAll()
        [annoncesList : annonces, usersList : users ]




    }
}
