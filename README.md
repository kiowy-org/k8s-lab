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

Créez un pod kuard depuis le fichier `5-1-kuard-pod.yaml`.

<details><summary>Réponse</summary>
  
  ```bash
    # Si vous obtenez une erreur, vous avez peut être oublié de supprimer le pod kuard de l'exercice 1...
    kubectl apply -f 5-1-kuard-pod.yaml
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

