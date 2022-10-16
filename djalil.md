# ROLES/FONCTIONNALITÉS
### 1. USER :
Ce role designe un utilisateur inscrit sur le site qui n'a pas des privileges administratifs il peut simplement :
- Visualiser toutes les annonces disponible dans le site : 

https://user-images.githubusercontent.com/91131467/196034082-ed3f92e2-6fac-49d3-98f0-dd1c101500c8.mp4

- Visualiser une annonce en cliquant sur son titre :

https://user-images.githubusercontent.com/91131467/196034822-1ad92825-ed96-4e31-95fe-7dc039671046.mp4

- Visualiser ses propres annonces a partir de ***MyAccount*** : 

https://user-images.githubusercontent.com/91131467/196034867-0ecdbbf4-f237-4a24-b923-1ef58b115e1e.mp4

- Modifier une de ses annonces en cliquant sur le bouton ***Edit*** de cette derniere :

https://user-images.githubusercontent.com/91131467/196034941-83b8e95c-b92d-41b3-98c5-ec043997fac9.mp4

- Ajouter une annonces en cliquant sur le bouton ***Add Ad*** :

https://user-images.githubusercontent.com/91131467/196036256-cc616310-9e2d-45c2-b8ba-2bee291d7ce2.mp4

Le FrontEnd gere l'affichage de cette interface precise pour l'USER grace aux balises GSP inclus comme par exemple : 
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
`user.getAuthorities()[0] == roleA` Permet de recuperer les ROLES de celui qui emis la requete (dans notre cas un USER) et de verifier si il possede le ROLE **Admin** pour ensuite proceder a la suppretion de l'utilisateur, sinon en renvois un code **403 Forbidden** qui previendra a l'emetteur qu'il lui manque une permission d'accès à la ressource (METHOD).

Exemple via Postman: 

![image](https://user-images.githubusercontent.com/91131467/196038765-e464cfcd-ac2c-42e0-b915-d72a12136398.png) ![image](https://user-images.githubusercontent.com/91131467/196038906-dfc24522-d0cf-4efe-a999-a514592d5b3b.png)

![image](https://user-images.githubusercontent.com/91131467/196039003-28f4546e-7fde-4a7e-8bfd-b6759a6182f7.png)

- **HASH PASSWORD** : 
$$\textcolor{red}{\text{REMARQUE IMPORTANTE :}}$$

```diff
- Le hashage du code est fait uniquement lors de la METHOD POST d'un nouveau utilisateur pour faciliter les test via postman pour les autres cas ou une modification de password est requise.
```

Lors que un administrateur (ou un visiteur qui souhaite creer son compte, qui n'a pas ete implemente) cree un utilisateur, il emmait une requete HTTP avec la methode POST, en temps normal, l'*username* et le *password* sont passe en parametre qu'on pourra les visualisees dans l'URL, pour cela, on a mis en place un systeme d'encryptage/decryptage pour le *password* qui conciste a crypter le *password* avant d'emmettre la requete a l'aide de cette fonction :

```javascript
CryptoJS.AES.encrypt(password, "My Secret Passphrase"),
```
De la librairie **CryptoJS**

Des la reception de la requete dans notre API REST, on procede au decryptage du *password* crypte pour ensuite creer l'USER avec ses identifiants : 

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
$$\textcolor{red}{\text{REMARQUE IMPORTANTE :}}$$

U2FsdGVkX1+/rueyItrsI0JAtmZQT7Sl0ITgVdJZVv4=
