package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import groovy.json.JsonBuilder

import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_ADMIN','ROLE_USER', 'ROLE_MODO'])
class HomeController {
    def springSecurityService
    def index() {
        List<User> users = User.findAll()
        List<Annonce> annonces = Annonce.findAll()
        [annoncesList : annonces, usersList : users]

    }
    def myaccount() {
        User user = springSecurityService.currentUser
        List<Annonce> annonces = Annonce.findAll()
        Map<Long, String> map = new HashMap<>();
        for(int i =0; i< annonces.size(); i++) {
            for(int j =0; j< annonces.get(i).getIllustrations().size(); j++) {
                map.put(annonces.get(i).getId(), annonces.get(i).getIllustrations()[j].getFilename())
            }

        }
        [annoncesList : annonces, currentUser : user, idfn : map]
    }
    def AllAds() {
        List<User> users = User.findAll()
        List<Annonce> annonces = Annonce.findAll()
        [annoncesList: annonces, usersList: users]
    }


    def AllUsers() {
        List<User> users = User.findAll()
        List<Annonce> annonces = Annonce.findAll()
        [annoncesList: annonces, usersList: users]
    }
}
