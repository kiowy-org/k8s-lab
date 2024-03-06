## ArgoCD - Déploiement automatisé

Automatiser le déploiement des éléments d'infrastructures Kubernetes via un dépôt GitHub.

### 1. Créez des ressources Kubernetes

Voici une petite liste de course des instances de ressource K8S que vous devez déployer **as code** dans votre namespace:
* 1 ConfigMap `<NOM>-cm` contenant la variable `OWNER_NAME=<NOM>`.
* 1 Service TCP qui expose `what-an-url:8080` pour les pods du déploiement `door`.
* 1 Deploiement `door` de 2 replicas d'un Pod `Guaranteed` avec:
  *  un conteneur executant l'image:
  ```sh
  europe-west1-docker.pkg.dev/k8s-formation/formation-img/unlocker:1.6
  ```
  *  `100m` de puissance de calcul et `128Mi` de mémoire.
  *  un label `app-of=<NOM>`.
  *  une variable environnement `OWNER_NAME` extraite depuis la configmap `<NOM>-cm`.

Enfin:
* 1 CronJob qui:
  * execute la commande `curl what-an-url.<NOM_DE_VOTRE_OPPOSANT>:8080 -d "unlocker=$OWNER_NAME"` toutes les minutes.
  * une variable environnement `OWNER_NAME` extraite depuis la configmap `<NOM>-cm`.

### 2. Mise en place de la synchronisation

Modifier le fichier d'application de ArgoCD `./common/argocd/<NOM>-application.yml` pour pointer la synchronisation de
votre application sur le dossier correspondant à votre namespace.

Dans le dossier correspondant à votre namespace:
* Créez les manifests YAML correspondants aux fichiers de vos ressources.
* Ajoutez le chemin vers ce fichier au fichier `kustomization.yml`.

### BONUS - Accéder au dashboard d'ArgoCD

Utiliser le port-forward sur le service `argocd-server` du namespace `argod` port `8080` vers `443`:
```sh
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
