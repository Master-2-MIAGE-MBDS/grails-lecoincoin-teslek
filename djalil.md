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


