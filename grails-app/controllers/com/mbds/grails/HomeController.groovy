package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_ADMIN','ROLE_USER', 'ROLE_MODO'])
class HomeController {

    def index() {
        List<Annonce> annonces = Annonce.findAll()
        [annoncesList : annonces ]

    }
}
