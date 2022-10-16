
# 1. Admin :
Ce role designe l'administrateur qui a le tout les droits dans notre site :



L'admin peut : 
- Visualiser toutes les annonces disponible dans le site : 


https://user-images.githubusercontent.com/91131812/196042121-025d4f34-0d17-4647-b7eb-51a0e73f3f60.mp4


- Visualiser une annonce en cliquant sur son titre : 




https://user-images.githubusercontent.com/91131812/196043285-8d97f712-947a-472b-96ea-6f00ced2ddef.mp4




- ## à partir de AllUsers : 

- Visualiser tout les utilisateurs avec leurs ID, username, password en * , role et ses annonces 


https://user-images.githubusercontent.com/91131812/196042182-5f1de71f-9e20-48de-b0e2-fc12bbbd6e6f.mp4

- Visualiser une annonce en cliquant sur leur ID : todo 


https://user-images.githubusercontent.com/91131812/196042557-a18532d5-43ca-4968-944d-78a86c58bfa4.mp4


- Modifier une des annonces en cliquant sur le bouton ***Edit*** de cette derniere :



- Ajouter un utilisateur en cliquant sur le bouton ***Add Ad*** :

https://user-images.githubusercontent.com/91131812/196042695-a4b2beef-389b-46bc-af67-1da43d466886.mp4


-Supprimer une annonce en cliquant sur le bouton ***rouge*** : 

https://user-images.githubusercontent.com/91131812/196042667-7da9dfb7-52bb-4450-bdc5-3d7839a42570.mp4


- ## à partir de AllAds :
-  Visualiser toutes lesannonces avec leurs ID, auteure, titre , description, prix et ses illustrations :  

https://user-images.githubusercontent.com/91131812/196042815-594db0e9-0778-4a76-a730-b65d806bed9b.mp4

- Visualier une annonce en cliquant sur leur titre : 

https://user-images.githubusercontent.com/91131812/196042557-a18532d5-43ca-4968-944d-78a86c58bfa4.mp4



- Ajouter un utilisateur en cliquant sur le bouton ***Add Ad*** :



-Supprimer une annonce en cliquant sur le bouton ***rouge*** : 



https://user-images.githubusercontent.com/91131812/196043035-9038119a-7e60-469c-90ee-92a01d1f9680.mp4



















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



