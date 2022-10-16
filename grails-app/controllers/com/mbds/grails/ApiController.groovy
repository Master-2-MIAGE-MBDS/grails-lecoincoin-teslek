package com.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.mapping.List
import org.springframework.http.HttpMethod
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest

import java.nio.file.Path


@Secured(['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR'])
class ApiController {

    def assetResourceLocator
    def springSecurityService

    /**
     * Singleton
     * Gestion des points d'entrée : GET / PUT / PATCH / DELETE
     */

    def annonce() {
        User user = springSecurityService.currentUser
        def roleA = Role.findById(1).save()
        def roleU = Role.findById(2).save()
        def roleM = Role.findById(3).save()
        // On vérifie qu'un ID ait bien été fourni
        if (!params.id)
            return response.status = 400
        // On vérifie que l'id corresponde bien à une instance existante
        def annonceInstance = Annonce.get(params.id)

        if (!annonceInstance)
            return response.status = 404

        switch (request.getMethod()) {

            case "GET":
                renderThis(request.getHeader("Accept"), annonceInstance)
                break;
            case "PUT":
                println user == annonceInstance.getAuthor()
                if (user.getAuthorities()[0] == roleA || user == annonceInstance.getAuthor()) {
                    if (!(params.illustration == '')) {
                        println "ici"
                        def illus = params.illustrations.split(",")
                        println illus
                        def adillus = annonceInstance.getIllustrations()
                        annonceInstance.illustrations = null
                        for (int i = 0; i < adillus.size(); i++) {
                            adillus[i].delete(flush: true)
                    }
                    for (int i = 0; i < illus.size(); i++)
                        annonceInstance.addToIllustrations(new Illustration(filename: illus[i]))
                    }
                    if (params.title != '' || params.price != '' || params.description != '') {
                        annonceInstance.title = params.title
                        annonceInstance.price = request.getParameter('price').toFloat()
                        annonceInstance.description = params.description
                        annonceInstance.save(flush: true)
                        return response.status = 200
                    } else
                        render(status: 400, text: 'NOT ALL FIELD FOUND')
                }
                else
                    render(status: 400, text: 'YOU DONT HAVE RIGHTS')
                break;
            case "PATCH":
                if(user.getAuthorities()[0] == roleA || user == annonceInstance.getAuthor()) {
                    if (params.title != '' && params.price != '' && params.description != '' && params.description != '') {
                        render(status: 400, text: 'YOU MEAN PUT ?')
                    } else if (params.title == '' && params.price == '' && params.description == '') {
                        render(status: 400, text: 'NO FIELDS WERE FOUND')
                    } else {

                        if (!(params.illustration == '')) {
                            def illus = params.illustrations.split(",")
                            println illus
                            def adillus = annonceInstance.getIllustrations()
                            annonceInstance.illustrations = null
                            for (int i = 0; i < adillus.size(); i++) {
                                adillus[i].delete(flush: true)
                            }
                            for (int i = 0; i < illus.size(); i++)
                                annonceInstance.addToIllustrations(new Illustration(filename: illus[i]))
                        }
                        if (params.title != '')
                            annonceInstance.title = params.title
                        if (params.price != '')
                            annonceInstance.price = request.getParameter('price').toFloat()
                        if (params.description != '')
                            annonceInstance.description = params.description
                        annonceInstance.save(flush: true)
                        return response.status = 200
                    }
                }
                else
                    render(status: 400, text: 'YOU DONT HAVE RIGHTS')

                break;
            case "DELETE":

                if (user.getAuthorities()[0] == roleA || user == annonceInstance.getAuthor()){
                annonceInstance.delete(flush:true)
                annonceInstance.save()}
                else
                    render(status: 403, text: 'YOU DONT HAVE RIGHTS')
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * Collection
     * POST / GET
     */

    def annonces() {
        User user = springSecurityService.getCurrentUser()
        def roleA = Role.findById(1).save()
        def roleU = Role.findById(2).save()
        def roleM = Role.findById(3).save()
        def annoncesInstance = Annonce.getAll()
        switch (request.getMethod()) {
            case "GET":
                renderThis(request.getHeader("Accept"), annoncesInstance)
                break;
            case "POST":

                if (user.getAuthorities()[0] == roleA ||user.getAuthorities()[0] == roleU) {
                    def annonceInstance = new Annonce(title: params.title, description: params.description, price: Float.parseFloat(params.price))
                    annonceInstance.setActive(Boolean.TRUE)
                    if (!(params.illustration == '')) {
                    request.getFiles("illustration").each {
                        def uploadFile = it
                        File newFile = new File("C:/Users/Dj/Desktop/M2/FRAMEWORK GRAILS/grails-lecoincoin-teslek/grails-app/assets/images/" + it.originalFilename)
                        uploadFile.transferTo(newFile)
                        annonceInstance.addToIllustrations(new Illustration(filename: it.originalFilename))
                    }}
                    if (user.getAuthorities()[0] == Role.findById(1)) {
                        if (params.author == null || User.findByUsername(params.author) == null) {
                            render(status: 400, text: 'AUTHOR NOT FOUND')
                        } else {
                            User author = User.findByUsername(params.author)
                            author.addToAnnonces(annonceInstance)
                            author.save(flush: true)
                            def url = createLink(controller: 'home', action: 'AllAds')
                            render(contentType: 'text/html', text: "<script>window.location.href='$url'</script>", status: 200)
                        }
                    } else {
                        user.addToAnnonces(annonceInstance)
                        user.save(flush: true)
                        def url = createLink(controller: 'home', action: 'myaccount')
                        render(contentType: 'text/html', text: "<script>window.location.href='$url'</script>", status: 200)
                    }
                }
                else
                    render(status: 400, text: 'YOU DONT HAVE RIGHTS')

                break;
                    default:
                    return response.status = 405
                    break;
                }
                return response.status = 406


    }



    def user() {
        User user = springSecurityService.currentUser
        def roleA = Role.findById(1).save()
        def roleU = Role.findById(2).save()
        def roleM = Role.findById(3).save()
        // On vérifie qu'un ID ait bien été fourni
        // On vérifie que l'id corresponde bien à une instance existante
        def userInstance = User.findById(params.id)
        if (!userInstance)
            return response.status = 404

        switch (request.getMethod()) {

            case "GET":
                renderThis(request.getHeader("Accept"), userInstance)
                break;

            case "PUT":
                System.out.println(user.getAuthorities()[0])

                if ((params.role == "Admin" || params.role == "admin") && user.getAuthorities()[0] == roleA) {
                    userInstance.setUsername(params.username)
                    userInstance.setPassword(params.password)
                    UserRole.remove(userInstance, userInstance.getAuthorities()[0])
                    UserRole.create(userInstance, roleA)
                } else {

                        if ((params.role == "User" || params.role == "user") && (user.getAuthorities()[0] == roleA || user.getAuthorities()[0] == roleM)) {
                            userInstance.setUsername(params.username)
                            userInstance.setPassword(params.password)
                            UserRole.remove(userInstance, userInstance.getAuthorities()[0])
                            UserRole.create(userInstance, roleU, true)
                        }
                        else {
                            if ((params.role == "Moderator" || params.role == "moderator") && (user.getAuthorities()[0] == roleA || user.getAuthorities()[0] == roleM)) {
                                userInstance.setUsername(params.username)
                                userInstance.setPassword(params.password)
                                UserRole.remove(userInstance, userInstance.getAuthorities()[0])
                                UserRole.create(userInstance, roleM, true)
                            } else {
                                if (params.role == "Moderator" || params.role == "moderator" || params.role == "User" || params.role == "user" || params.role == "Admin" || params.role == "admin")
                                    render(status: 403, text: 'YOU DONT HAVE RIGHTS')
                                else
                                render(status: 400, text: 'ROLE DOES NOT EXIST')
                            }
                        }
        }
                    userInstance.save(flush : true)
                return response.status = 200
                break;
            case "PATCH":

                if(params.username != '' && params.password!= '' && params.role != '') {
                    render(status: 400, text: 'YOU MEAN PUT ?')
                }
                else if(params.username == '' && params.password == '' && params.role == ''){
                    render(status: 400, text: 'NO FIELDS WERE FOUND')
                }
                else {

                    if (params.role) {

                        if ((params.role == "Admin" ||params.role == "admin") && user.getAuthorities()[0] == roleA) {
                            UserRole.remove(userInstance, userInstance.getAuthorities()[0])
                            UserRole.create(userInstance, roleA)
                        }
                        else {

                            if ((params.role == "User" || params.role == "user") && (user.getAuthorities()[0] == roleA || user.getAuthorities()[0] == roleM)) {
                                UserRole.remove(userInstance, userInstance.getAuthorities()[0])
                                UserRole.create(userInstance, roleU, true)
                            } else {
                                if ((params.role == "Moderator" || params.role == "moderator") && (user.getAuthorities()[0] == roleA || user.getAuthorities()[0] == roleM)) {
                                    UserRole.remove(userInstance, userInstance.getAuthorities()[0])
                                    UserRole.create(userInstance, roleM, true)
                                } else {
                                    if (params.role == "Moderator" || params.role == "moderator" || params.role == "User" || params.role == "user" ||params.role == "Admin" ||params.role == "admin" )
                                       render(status: 403, text: 'YOU DONT HAVE RIGHTS')
                                    else
                                    render(status: 400, text: 'ROLE DOES NOT EXIST')

                                }
                            }
                        }
                        if (params.username)
                            userInstance.setUsername(params.username)
                        if (params.password)
                            userInstance.setPassword(params.password)

                    }
                    else
                        userInstance.save(flush : true )

                    return response.status = 200

                }



                break;
            case "DELETE":
                if (user.getAuthorities()[0] == roleA){
                UserRole.remove(userInstance,UserRole.findByUser(userInstance).getRole())
                userInstance.delete(flush : true)
                    return response.status = 200}
                else
                    render(status: 403 , text: 'YOU DONT HAVE RIGHTS')


                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406


    }

    def users() {
        User user = springSecurityService.currentUser
        def roleA = Role.findById(1).save()
        def roleU = Role.findById(2).save()
        def roleM = Role.findById(3).save()

        def usersInstance = User.getAll()
        switch (request.getMethod()) {

            case "GET":
                renderThis(request.getHeader("Accept"), usersInstance)
                break;
            case "POST":
                def role = null
                if(params.role.toLowerCase() == 'admin' && user.getAuthorities()[0] == roleA )
                    role = Role.findById(1)
                else {
                    if (params.role.toLowerCase() == 'user' && user.getAuthorities()[0] == roleA )
                        role = Role.findById(2)
                    else {
                        if (params.role.toLowerCase() == 'moderator' && user.getAuthorities()[0] == roleA )
                            role = Role.findById(3)
                        else {
                            if (params.role.toLowerCase() == 'admin' || params.role.toLowerCase() == 'user' || params.role.toLowerCase() == 'moderator')
                                render(status: 403, text: 'YOU DONT HAVE RIGHTS')
                            else
                            render(status: 400, text: 'ROLE DOES NOT EXIST')
                        }
                    }
                }

                AES a = new AES()
                System.out.println(request.getParameter('password'))
                String decrypt =  a.decryptText(request.getParameter('password'),"My Secret Passphrase")
                def userInstance = new User(username: params.username , password:decrypt)
                userInstance.save(flush : true)
                UserRole.create(userInstance, role , true)
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406



    }
    def illustrations() {
        if (!params.id)
            return response.status = 400
        def adInst = Annonce.findById(params.id)
        switch (request.getMethod()) {
            case "GET":
                def illuNames = []
                for (int i = 0; i < adInst.getIllustrations().size(); i++)
                {
                    illuNames.add(adInst.getIllustrations()[i].getFilename())
                }
                render illuNames
                //renderThis(request.getHeader("Accept"), illuNames)
                return response.status = 200
                break;
            case "POST":
                adInst.
                request.getFiles("editIllustration").each {
                    def uploadFile = it
                    String uploadDir =  grailsApplication.config.getProperty('illustrations.basePath')
                    File newFile = new File(uploadDir+"/"+it.originalFilename)
                    uploadFile.transferTo(newFile)
                    annonceInstance.addToIllustrations(new Illustration(filename: it.originalFilename))
                }
                return response.status = 200
                break;
            default:
                return response.status = 405
                break;
        }
        return response.status = 406



    }


    def renderThis(String acceptHeader, Object object) {
        switch (acceptHeader) {
            case 'xml':
            case 'text/xml':
            case 'application/xml':
                render object as XML
                break;
            case 'json':
            case 'text/json':
            case 'application/json':
                render object as JSON
                break;
        }
    }
}