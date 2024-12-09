# 2. Labels

## Exercice 7

Ajoutez un label `canary=true` à votre pod kuard.
Utilisez l'option `-l` de `kubectl get` pour vérifier que votre label permet bien de trier les pods.

<details>
    <summary>Aide</summary>

```shell
kubectl get pods --show-labels # Affiche les labels sur une liste
kubectl label pods kuard "canary=true" 

kubectl get pods -L canary
kubectl get pods -l canary=false

kubectl label pods kuard "canary-" # Retire un label
```

</details><br>

Vous pouvez également annoter votre pod, avec `kubectl annotate pod kuard k8s-training/owner=<prenom>`. Vous pouvez vérifier votre annotation avec `kubectl describe`.

### Labels aerobics

Tout d'abord, créer 5 pods `nginx` ( nginx1...5 ) avec le labels `img=nginx` via la commande suivante :

```bash
for i in `seq 1 5`; do kubectl run nginx$i --image=nginx -l img=nginx ; done
```

Effectuer ensuite les manipulations suivantes en utilisant une seule commande par instruction :

1. Affichez les labels des pods.
2. Ajoutez le label `app=v1` pour `nginx1` et `nginx2`.
3. Ajoutez le label `app=v2` pour `nginx2` et `nginx3`. 
   Qu'est ce qu'il passé pour `nginx2` ?
4. Annotez les pods `img=nginx` avec `k8s-training/owner=<prenom>`.
5. Affichez les différentes valeurs du label `app` de chaque pods dans une colonne dédié du `kubectl get` ( option `-L`).

> Avant de changer de section, supprimez tous les pods créer durant cet exercice.
> (en une commmande seulement 😉)

---

Section suivante, [les services](3_services.md).
