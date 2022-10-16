### *Membres du groupe :*
  - *MOUSSA BOUDJEMAA Mehdi Djalil*
  - *MATALLAH Mouncif*

# [*Le dossier contenant les collections pour les test sur Postman*](https://github.com/Master-2-MIAGE-MBDS/grails-lecoincoin-teslek/tree/last/POSTMAN-COLLECTIONS)

## !!! SI JAMAIS VOUS SOUHAITEZ POUVOIR UPLOAD LES ILLUSTRATIONS IL FAUT CHANGER CETTE LIGNE DE CODE DANS [ApiController](https://github.com/Master-2-MIAGE-MBDS/grails-lecoincoin-teslek/blob/43ef3ce12ecec443f3f074645ddaf5f1c884cf30/grails-app/controllers/com/mbds/grails/ApiController.groovy#L146) PAR : `File newFile = new File("Votre/Absolute/Path/Du/Projet/" + it.originalFilename)` !!!


# Démonstration demandée :

https://user-images.githubusercontent.com/91131467/196057093-dd0e6b60-6238-4987-b013-46357fabb1c8.mp4

# I. Présentation : 

  Le site e-commerce de la societé LECOINCOIN est un site de consommation collaborative qui met en relation essentiellement des professionnels comme des particuliers en France, souhaitant donner, vendre, ou acheter. Dans ce site on a 3 roles importants Admin, Moderator et User chaqu'un a ses priviléges. en commencant par l'Admin qui tout les droits et accés a tout les données jusqu'au simple User qui a le minimum des droits et d'accés au données

# II. ROLES/FONCTIONNALITÉS

### 1. USER :
Ce rôle designe un utilisateur inscrit sur le site qui n'a pas des privilèges administratifs il peut simplement :

- Visualiser toutes les annonces disponibles dans le site :

https://user-images.githubusercontent.com/91131467/196034082-ed3f92e2-6fac-49d3-98f0-dd1c101500c8.mp4

- Visualiser une annonce en cliquant sur son titre :

https://user-images.githubusercontent.com/91131467/196034822-1ad92825-ed96-4e31-95fe-7dc039671046.mp4

- Visualiser ses propres annonces à partir de ***MyAccount*** : 

https://user-images.githubusercontent.com/91131467/196034867-0ecdbbf4-f237-4a24-b923-1ef58b115e1e.mp4

- Modifier une de ces annonces en cliquant sur le bouton ***Edit*** de cette dernière :

https://user-images.githubusercontent.com/91131467/196034941-83b8e95c-b92d-41b3-98c5-ec043997fac9.mp4

- Ajouter une annonce en cliquant sur le bouton ***Add Ad*** :

https://user-images.githubusercontent.com/91131467/196036256-cc616310-9e2d-45c2-b8ba-2bee291d7ce2.mp4

Le FrontEnd gere l'affichage de cette interface précise pour l'USER grace aux balises GSP inclus comme par exemple : 
```html
<sec:ifAnyGranted roles="ROLE_USER">
  <a href = "/home/myaccount">
    <i  class="zmdi zmdi-widgets" ></i>
      My Account
  </a>
</sec:ifAnyGranted>
```
### 2. Admin :

Ce rôle designe l'administrateur qui a tous les droits au sein de l'application, ainsi, il peut :

- Visualiser toutes les annonces disponibles dans le site : 

https://user-images.githubusercontent.com/91131812/196042121-025d4f34-0d17-4647-b7eb-51a0e73f3f60.mp4

- Visualiser une annonce en cliquant sur son titre : 

https://user-images.githubusercontent.com/91131812/196044696-4c7e93fc-b5b5-489e-9841-7b0805a3964f.mp4

  - #### à partir de AllUsers : 

    - Visualiser tous les utilisateurs avec leurs ID, username, password en * , rôle et leurs annonces :
    
    https://user-images.githubusercontent.com/91131812/196042182-5f1de71f-9e20-48de-b0e2-fc12bbbd6e6f.mp4

    - Visualiser une annonce en cliquant sur leur ID : 
    
    https://user-images.githubusercontent.com/91131812/196045020-3f3a59ce-1b34-453b-961e-fa99ee889d86.mp4

    - Modifier un utilisateur en cliquant sur le bouton ***Edit*** de cette dernier :

    https://user-images.githubusercontent.com/91131812/196043473-fa8e40f3-c1de-43eb-ad6b-f469b17d2b6a.mp4

    - Ajouter un utilisateur en cliquant sur le bouton ***Add Ad*** :

    https://user-images.githubusercontent.com/91131812/196042695-a4b2beef-389b-46bc-af67-1da43d466886.mp4

    - Supprimer une annonce en cliquant sur le bouton ***rouge*** : 

    https://user-images.githubusercontent.com/91131812/196042667-7da9dfb7-52bb-4450-bdc5-3d7839a42570.mp4

  - #### à partir de AllAds :
  
    - Visualiser toutes les annonces avec leurs ID, auteur, titre, description, prix et ses illustrations :  

    https://user-images.githubusercontent.com/91131812/196042815-594db0e9-0778-4a76-a730-b65d806bed9b.mp4

    - Visualier une annonce en cliquant sur son titre : 

    https://user-images.githubusercontent.com/91131812/196042557-a18532d5-43ca-4968-944d-78a86c58bfa4.mp4

    - Modifier une des annonces en cliquant sur le bouton ***Edit*** de cette derniere :

    https://user-images.githubusercontent.com/91131812/196045241-8f387555-9ab6-4764-8303-ffc195725d44.mp4

    - Ajouter une annonce en cliquant sur le bouton ***Add Ad*** :

    https://user-images.githubusercontent.com/91131812/196043629-1cd25902-0ae1-4638-9bec-ee97acbe688c.mp4

    - Supprimer une annonce en cliquant sur le bouton ***rouge*** : 

    https://user-images.githubusercontent.com/91131812/196043035-9038119a-7e60-469c-90ee-92a01d1f9680.mp4

### 3. MODERATOR :

Ce rôle est légèrement similaire à celui de l'admin, sa différence est dans le fait qui peut ni supprimer, ni ajouter une annonce ou un utilisateur, aussi il ne peut pas modifier le rôle d'un utilisateur étant un admin :

- Visualiser les annonces dans Dashboard exctement comme l'admin. 

- Visualiser une annonce en cliquant sur son titre exactemment comme l'admin.

- #### à partir de AllUsers : 

  - Visualiser tous les utilisateurs avec leurs ID, username, password en * , rôle et ses annonces, et visualiser les annonces en cliquant sur leur ID : 

   https://user-images.githubusercontent.com/91131812/196053385-0ddaff12-d8ee-4253-a871-8938ce9e30cb.mp4

  - Modifier un utilisateur en cliquant sur le bouton ***Edit*** de ce dernier :

   https://user-images.githubusercontent.com/91131812/196045625-0f0cea97-1a7f-4357-bb01-ee93ef9a2188.mp4

- #### à partir de AllAds :

  - Visualiser toutes les annonces avec leurs ID, auteur, titre , description, prix et leurs illustrations :  

  https://user-images.githubusercontent.com/91131812/196045728-2a73610b-2156-4754-8541-4d5b2a80a29f.mp4
  
  - Visualier une annonce en cliquant sur son titre exactement comme l'admin.

  - Modifier une des annonces en cliquant sur le bouton ***Edit*** de cette derniere :

  https://user-images.githubusercontent.com/91131812/196047816-8060bfe1-ac1d-4bdd-b1d7-7e3e727c61d4.mp4
  
# III. API REST :

  Nous disposant d'un controller du nom de [ApiController.groovy](https://github.com/Master-2-MIAGE-MBDS/grails-lecoincoin-teslek/blob/last/grails-app/controllers/com/mbds/grails/ApiController.groovy) au sein de notre projet, il s'agit du moteur de notre API REST, il s'occupe de la gestion des différentes méthodes GET, PUT, PATCH, DELETE et POST ainsi que les réponses et les status de ces derniers tous en contrôle Lant la sécurité et les droits de la personne qui l'utilisent.

  L'annotation *@Secured* designe les personnes ayant un des roles mentionees ce qui lui permettra d'utiliser l'API ou non dans le cas contraire, dans notre cas, on donne l'acces a tout les utilisateurs ayant n'importe quel role des 3 etant donne que la gestion des droits ce fait dans le controller .
  
```java

@Secured(['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR'])
class ApiController {

    def assetResourceLocator
    def springSecurityService

    /**
     * Singleton
     * Gestion des points d'entrée : GET / PUT / PATCH / DELETE
     */
  ```

 La gestion des droits se fait a partir des *if statement* dans les methodes HTTP, apres la fin de la procedure de la requete, un message de status est retourne dans cette exemple on a: 
  - 200 quand tout se deroule correctement.
  - 400 signifie une anomalie, dans ce cas la, un manque d'information, de parametres, ou un role inexistant peut l'engendrer.
  - 403 quand l'emetteur ne dispose des droits necessaires pour effectuer la requete. 
  
  Par exemple : 

```java 
case "PUT":
  if (user.getAuthorities()[0] == roleM || user.getAuthorities()[0] == roleA || user == annonceInstance.getAuthor()) {
    if (params.illustrations != '') {
      def illus = params.illustrations.split(",")
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
    } 
    else
      render(status: 400, text: 'NOT ALL FIELDS FOUND'
  }
  else
    render(status: 400, text: 'YOU DONT HAVE RIGHTS')
  break;                         
```

### SECURITE
- **API REST** :  
Chaque rôle à ses propres droits et interdictions (par exemple un USER ne peut pas supprimer un autre utilisateur), sa gestion est au niveau de notre **ApiController** comme suit :
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
`user.getAuthorities()[0] == roleA` Permets de récupérer les ROLES de celui qui émit la requête (dans notre cas un USER) et de vérifier s'il possède le ROLE **Admin** pour ensuite procéder à la suppression de l'utilisateur, sinon en renvois un code **403 Forbidden** qui préviendra à l'émetteur qu'il lui manque une permission d'accès à la ressource (METHOD).

Exemple via Postman: 

![image](https://user-images.githubusercontent.com/91131467/196038765-e464cfcd-ac2c-42e0-b915-d72a12136398.png) ![image](https://user-images.githubusercontent.com/91131467/196038906-dfc24522-d0cf-4efe-a999-a514592d5b3b.png)

![image](https://user-images.githubusercontent.com/91131467/196039003-28f4546e-7fde-4a7e-8bfd-b6759a6182f7.png)

- **HASH PASSWORD** : 
$$\textcolor{red}{\text{REMARQUE IMPORTANTE :}}$$

```diff
- Le hashage du code est fait uniquement lors de la METHOD POST d'un nouvel utilisateur pour faciliter les tests via postman pour les autres cas ou une modification de password est requise.
```

Lors qu'un administrateur (ou un visiteur qui souhaite creer son compte, qui n'a pas ete implémente) cree un utilisateur, il emmait une requête HTTP avec la méthode POST, en temps normal, l'*username* et le *password* sont passés en paramètre qu'on pourra les visualiser dans l'URL, pour cela, on a mis en place un système d'encryptage/décryptage pour le *password* qui consiste à crypter le *password* avant d'émettre la requête a l'aide de cette fonction ;

```javascript
CryptoJS.AES.encrypt(password, "My Secret Passphrase"),
```
De la librairie [**CryptoJS**](https://github.com/brix/crypto-js)

Dès la réception de la requête dans notre API REST, ont procede au décryptage du *password* crypté pour ensuite creer l'USER avec ses identifiants : 

```java
//...//
AES a = new AES()
String decrypt =  a.decryptText(request.getParameter('password'),"My Secret Passphrase")
def userInstance = new User(username: params.username , password:decrypt)
userInstance.save(flush : true)
UserRole.create(userInstance, role , true)
return response.status = 200
//...//
```
[**AES**](https://github.com/Master-2-MIAGE-MBDS/grails-lecoincoin-teslek/blob/last/src/main/groovy/com/mbds/grails/AES.java) est une classe utilitaire qui contient la methode pour l'encryptage *decryptText()*.



$$\textcolor{red}{\text{AVANT D'EFFECTUER UN POST SUR USER (POUR LE CREER) VEUILLEZ :}}$$

En raison de l'utilisation de cette méthode, vous n'allez pas pouvoir creer un utilisateur via Postman on lui spécifiant un mot de classique, étant donné quil doit d'abord être crypter, pour cela, deux méthodes :

 - Créer un utilisateur à partir du Front End, on se connectent avec un administrateur via le formulaire situant dans **/api/AllUsers** : 

![image](https://user-images.githubusercontent.com/91131467/196044445-45a75ea1-54ea-407a-8e75-a221c272c448.png)

 - Créer un utilisateur avec ce mot de passe `U2FsdGVkX1+/rueyItrsI0JAtmZQT7Sl0ITgVdJZVv4=` qui correspond a `admin`

# IV. BONUS:

Nous avons réussi à faire le déploiement de notre application GRAILS via la plateforme HEROKU.

Lien ver le site : https://lecoincoincoin.herokuapp.com/


