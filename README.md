# Formation Kubernetes - Lab

Bienvenue dans le lab de cette formation Kubernetes. Dans ce dépôt vous trouverez l'ensemble des TPs avec les instructions.

## 1. Les Pods

### Exercice 1

Créez un pod appelé `kuard` grâce à `kubectl run`.

<details><summary>Réponse</summary>
  
  ```bash
    kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
    kubectl get pods
    kubectl delete pod/kuard
  ```

</details>
  
### Exercice 2

Créez un pod kuard depuis le fichier `./1_pods/1-kuard-pod.yaml`.

<details><summary>Réponse</summary>
  
  ```bash
    # Si vous obtenez une erreur, vous avez peut être oublié de supprimer le pod kuard de l'exercice 1...
    kubectl apply -f ./1_pods/1-kuard-pod.yaml
  ```

</details>

Essayez les commandes `kubectl` qui permettent de manipuler les pods.

```shell
kubectl get pods # Pour lister les pods
kubectl describe pod kuard # Affiche les informations détaillées du pod
```

Dans un autre terminal, exécutez la commande `kubectl port-forward pod/kuard 8080:8080` puis accédez à http://localhost:8080 (laissez bien la commande `port-forward` en cours d'exécution).

Vous pouvez ensuite tuer la commande (`Ctrl+C`), puis executez les commandes suivantes :

```shell
kubectl exec kuard -- date
kubectl exec -it kuard -- ash
```
Que déduisez vous le l'utilisation des options `i` et `t` ?

Enfin, visualisez les logs de vontre conteneur grâce à `kubectl logs kuard`.
Quelques options utiles : 
* `-c` Vous permet de sélectionner le conteneur dans un pod multi-conteneurs.
* `--previous` vous permet de voir les logs du précedent contenur (dans le cas d'un conteneur qui a été redémarré).

Pour finir, supprimez le conteneur depuis son fichier grâce à la commande `kubectl delete -f ./1_pods/1-kuard-pod.yaml`.

### Exercice 3

Créez un pod kuard avec une liveness probe, puis testez le comportement de Kubernetes en cas de défaillance de la probe.

```bash
kubectl apply -f ./1_pods/2-kuard-pod-health.yaml
```

Une fois le pod démarré, exécutez `kubectl get pods -w` afin de surveiller les changements d'état du pod (ne tuez pas la commande).

Dans un autre terminal, utilisez une commande vue plus haut pour avoir accès au pod kuard.
<details>
  <summary>Réponse</summary>
  
  ```bash
  # Exécutez cette commande dans un autre terminal
  kubectl port-forward pod/kuard 8080:8080
  ```
  
</details>

Accédez à http://localhost:8080, dans l'onglet liveness, changez le code de retour de la liveness probe et observez le résultat dans Kubernetes et dans kuard.

### Exercice 4

Créez un pod kuard avec une request grâce au fichier `./1_pods/3-kuard-pod-resreq.yaml`. Cherchez la commande vous permettant de trouver la QoS du pod.

<details><summary>Réponse</summary>
  
  ```bash
    kubectl apply -f ./1_pods/3-kuard-pod-resreq.yaml
    kubectl describe pod kuard | grep -i QoS
  ```

</details>

Modifiez le fichier `./1_pods/3-kuard-pod-resreq.yaml` afin d'indiquer une requête de mémoire à 100Gi (`memory: 100Gi`).
Puis, appliquez les changements grâce à `kubectl apply -f ...`. Affichez les pods avec `kubectl get pods`, que constatez vous ?

### Exercice 5

Créez un pod kuard avec une limite grâce au fichier `./1_pods/4-kuard-pod-reslim.yaml`. Accédez au pod kuard sur http://localhost:8080, onglez memory, allouez de la mémoire jusqu'à dépasser la limite. Que constatez vous dans kuard et dans Kubernetes ?

<details>
  <summary>Aide</summary>
  
  ```bash
  kubectl apply -f ./1_pods/4-kuard-pod-reslim.yaml
  kubectl get po -w # Laisser la commande s'exécuter
  # Dans un autre terminal
  kubectl port-forward pod/kuard 8080:8080
  ```
</details>
