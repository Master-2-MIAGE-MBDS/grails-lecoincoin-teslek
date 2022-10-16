# ROLES/FONCTIONNALITÉS
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
### 2. SECURITE
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
De la librairie **CryptoJS**

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
$$\textcolor{red}{\text{AVANT D'EFFECTUER UN POST SUR USER (POUR LE CREER) VEUILLEZ :}}$$

En raison de l'utilisation de cette méthode, vous n'allez pas pouvoir creer un utilisateur via Postman on lui spécifiant un mot de classique, étant donné quil doit d'abord être crypter, pour cela, deux méthodes :

 - Créer un utilisateur à partir du Front End, on se connectent avec un administrateur via le formulaire situant dans **/api/AllUsers** : 

![image](https://user-images.githubusercontent.com/91131467/196044445-45a75ea1-54ea-407a-8e75-a221c272c448.png)

 - Créer un utilisateur avec ce mot de passe `U2FsdGVkX1+/rueyItrsI0JAtmZQT7Sl0ITgVdJZVv4=` qui correspond a `admin`

# BONUS:

Nous avons réussi à faire le déploiement de notre application GRAILS via la plateforme HEROKU.

Lien ver le site : https://lecoincoincoin.herokuapp.com/


