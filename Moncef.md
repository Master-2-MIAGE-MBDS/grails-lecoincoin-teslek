# I.Présentation : 
Le site e-commerce de la societé LECOINCOIN est un site de consommation collaborative qui met en relation essentiellement des professionnels comme des particuliers en France, souhaitant donner, vendre, ou acheter. Dans ce site on a 3 roles importants Admin, Moderator et User chaqu'un a ses priviléges. en commencant par l'Admin qui tout les droits et accés a tout les données jusqu'a User qui le minimum de droit et d'accés au données



# 1. Admin :
Ce role designe l'administrateur qui a le tout les droits dans notre site :



L'admin peut : 
- Visualiser toutes les annonces disponible dans le site : 


https://user-images.githubusercontent.com/91131812/196042121-025d4f34-0d17-4647-b7eb-51a0e73f3f60.mp4


- Visualiser une annonce en cliquant sur son titre : 





https://user-images.githubusercontent.com/91131812/196044696-4c7e93fc-b5b5-489e-9841-7b0805a3964f.mp4









- ## à partir de AllUsers : 

- Visualiser tout les utilisateurs avec leurs ID, username, password en * , role et ses annonces 


https://user-images.githubusercontent.com/91131812/196042182-5f1de71f-9e20-48de-b0e2-fc12bbbd6e6f.mp4

- Visualiser une annonce en cliquant sur leur ID : 





https://user-images.githubusercontent.com/91131812/196045020-3f3a59ce-1b34-453b-961e-fa99ee889d86.mp4






- Modifier un utilisateur en cliquant sur le bouton ***Edit*** de cette derniere :


https://user-images.githubusercontent.com/91131812/196043473-fa8e40f3-c1de-43eb-ad6b-f469b17d2b6a.mp4




- Ajouter un utilisateur en cliquant sur le bouton ***Add Ad*** :

https://user-images.githubusercontent.com/91131812/196042695-a4b2beef-389b-46bc-af67-1da43d466886.mp4


-Supprimer une annonce en cliquant sur le bouton ***rouge*** : 

https://user-images.githubusercontent.com/91131812/196042667-7da9dfb7-52bb-4450-bdc5-3d7839a42570.mp4


- ## à partir de AllAds :
-  Visualiser toutes lesannonces avec leurs ID, auteure, titre , description, prix et ses illustrations :  

https://user-images.githubusercontent.com/91131812/196042815-594db0e9-0778-4a76-a730-b65d806bed9b.mp4

- Visualier une annonce en cliquant sur leur titre : 

https://user-images.githubusercontent.com/91131812/196042557-a18532d5-43ca-4968-944d-78a86c58bfa4.mp4


- Modifier une des annonces en cliquant sur le bouton ***Edit*** de cette derniere :


https://user-images.githubusercontent.com/91131812/196045241-8f387555-9ab6-4764-8303-ffc195725d44.mp4



- Ajouter une annonce en cliquant sur le bouton ***Add Ad*** :


https://user-images.githubusercontent.com/91131812/196043629-1cd25902-0ae1-4638-9bec-ee97acbe688c.mp4



-Supprimer une annonce en cliquant sur le bouton ***rouge*** : 



https://user-images.githubusercontent.com/91131812/196043035-9038119a-7e60-469c-90ee-92a01d1f9680.mp4






# 2. Moderateur :
Ce role a acces a tout les données exactement comme l'admin mais il n'a pas tout les fontionalité de ce dernier (ni supprimer ou ajouter une annonce ou un utilisateur, aussi il ne peut pas modifier le role d'un utilisateur à un Admin) 




Le modérateur peut : 

-Visualiser les annonces dans Dashboard exctement commee l'admin. 


- Visualiser une annonce en cliquant sur son titre exactemment comme l'admin.

- ## à partir de AllUsers : 

- Visualiser tout les utilisateurs avec leurs ID, username, password en * , role et ses annonces , et visualiser les annonces en cliquant sur leur ID : 



- Modifier un utilisateur en cliquant sur le bouton ***Edit*** de cette derniere :



https://user-images.githubusercontent.com/91131812/196045625-0f0cea97-1a7f-4357-bb01-ee93ef9a2188.mp4




- ## à partir de AllAds :
-  Visualiser toutes lesannonces avec leurs ID, auteure, titre , description, prix et ses illustrations :  


https://user-images.githubusercontent.com/91131812/196045728-2a73610b-2156-4754-8541-4d5b2a80a29f.mp4




- Visualier une annonce en cliquant sur leur titre exactement comme l'admin.



- Modifier une des annonces en cliquant sur le bouton ***Edit*** de cette derniere :



https://user-images.githubusercontent.com/91131812/196047816-8060bfe1-ac1d-4bdd-b1d7-7e3e727c61d4.mp4

























Le FrontEnd gere l'affichage de cette interface precise pour l'Admin et le moderateur grace aux balises GSP inclus comme par exemple : 
```html
  <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                    <a href="/home/AllUsers" >
                        <i  class="zmdi zmdi-widgets" ></i>
                            All Users
                    </a>
                </sec:ifAnyGranted>
```

Aussi gére les personnes connéctés on utilisant la balise GSP par exemple : 

```html
  <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN, ROLE_MODERATOR">
                    <section id = "panel-user-2">
                        <div class="container">
                            <g:each in="${annoncesList}" var="c">
                                <div class="col-xs-12 col-md-6">
                                    <!-- First product box start here-->
                                    <div class="prod-info-main prod-wrap clearfix">
                                        <div class="row">
                                            <div class="col-md-5 col-sm-12 col-xs-12">
                                                <div class="product-image">
                                                  ....>
 </sec:ifLoggedIn>
```

### 2. SECURITE
- **API REST** :  
Chaque roles a ses propores droit et interdiction (par exemple un USER ne peut pas supprimer un autre utilsateur), on gere cela au niveau de notre **ApiController** comme suit :
```java
//Exemple d'un utilisateur qui va envoyer une requete DELETE dans /api/user/id
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

        //...//
            case "DELETE":
                if (user.getAuthorities()[0] == roleA){
                  UserRole.remove(userInstance,UserRole.findByUser(userInstance).getRole())
                  userInstance.delete(flush : true)
                  return response.status = 200
                }
                else
                    render(status: 403, text: 'YOU DONT HAVE RIGHTS')
                break;
         //...//
         
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }
```


## 3.API REST :

On a un APIContolleur dans notre Package controlleur ou on a implémenter en utilisants des methodes et dans ces methodes on fait des swith ou dans ces dernier on implémente les methodes GET, PUT, PATCH, DELETE et POST. 

On a utilisé Secured au debut du la class API Controlleur pour donner accées a les roles qui peuvent effectuer des changements en utilisant a l'API dans notre cas on a donné acces a tout les roles.

``` 
java

@Secured(['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR'])
class ApiController {

    def assetResourceLocator
    def springSecurityService

    /**
     * Singleton
     * Gestion des points d'entrée : GET / PUT / PATCH / DELETE
     */
  ```


 On a géré les droits par utiliser des conditions dans les methodes ou on retourne 200 quand tout est bon, 400 qu'on a un manque d'information avec un message "NOT ALL FIELDS FOUND" ou "ROLE DOES NOT EXIST" et 403 qu'on le user connécté n'a pas le droit a effectuer la methode avec un message de "YOU DONT HAVE RIGHTS". 

par exemple : 



``` 
java 
case "PUT":
                if (user.getAuthorities()[0] == roleM || user.getAuthorities()[0] == roleA || user == annonceInstance.getAuthor()) {
                    if (params.illustrations != '') {
                        def illus = params.illustrations.split(",")
                        println illus
                        def adillus = annonceInstance.getIllustrations()
                        annonceInstance.illustrations = null
                        for (int i = 0; i < adillus.size(); i++)
                            adillus[i].delete(flush: true)
                        for (int i = 0; i < illus.size(); i++)
                            annonceInstance.addToIllustrations(new Illustration(filename: illus[i]))
                    }
                    if (params.title != '' || params.price != '' || params.description != '' || params.author != '') {
                        annonceInstance.setAuthor(User.findByUsername(params.author))
                        annonceInstance.title = params.title
                        annonceInstance.price = request.getParameter('price').toFloat()
                        annonceInstance.description = params.description
                        annonceInstance.save(flush: true)
                        return response.status = 200
                    } else
                        render(status: 400, text: 'NOT ALL FIELDS FOUND')
                }
                else
                    render(status: 400, text: 'YOU DONT HAVE RIGHTS')
                break;
                
                
       ```

