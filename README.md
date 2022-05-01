# Formation Kubernetes - Lab

Bienvenue dans le lab de cette formation Kubernetes. Dans ce dépôt vous trouverez l'ensemble des TPs avec les instructions.

## 1. Les Pods

### Exercice 1

Démarrez un pod appelé `kuard` grâce à `kubectl run`.

<details><summary>Réponse</summary>
<p>
  ```bash
    kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
    kubectl get pods
    kubectl delete pod/kuard
  ```
</p>
</details>
  
