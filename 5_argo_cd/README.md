# TP final 

Créez les ressources nécessaires au déploiement de l'application `unlocker` dans votre namespace.

## 1. Créez des ressources Kubernetes

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

## 2. Packaging via Kustomize

* Créez les manifests YAML correspondants aux fichiers de la partie 1.
* Créez un fichier `kustomization.yml` et listez y les fichiers du dossier.
* Deployer l'architecture via `kubectl apply -k .`.

> [!tip]
> Documentation de [Kustomize](https://kustomize.io/)
