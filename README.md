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
