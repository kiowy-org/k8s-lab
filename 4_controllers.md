## 4. Controllers

### Exercice 8

Déployez un ReplicaSet afin de gérer un ensemble de pods identiques.

Utilisez le fichier `./2_replicas_set/1-kuard-rs.yaml` afin de créer le ReplicaSet de pod Kuard.

<details>
    <summary>Aide</summary>

```bash
kubectl apply -f ./2_replicas_set/1-kuard-rs.yaml
```

</details>

Explorez son fonctionnement via les commandes suivantes :

```shell
kubectl describe rs kuard 

kubectl scale replicaset kuard --replicas=4 # Vous pouvez ensuite lister les pods pour vérifier que ça fonctionne

kubectl autoscale rs kuard --min=2 --max=5 --cpu-percent=80
kubectl get hpa # Vous pouvez également describe cet objet

kubectl delete rs kuard
```

### Exercice 9

Créez un déploiement grâce au fichier `./1_pods/7-kuard-deploy.yaml` et inspectez l'objet créé.

<details>
    <summary>Aide</summary>

```bash
kubectl apply -f ./1_pods/7-kuard-deploy.yaml
kubectl get deploy -o wide
kubectl describe deploy kuard
```

</details>

Afin de tester la fonctionalité de Rolling Update, nous allons provoquer un rollout via la commande suivante :

```bash
kubectl set image deploy kuard kuard-amd64=gcr.io/kuar-demo/kuard-amd64:green
```

Observez via `kubectl get pods -w` le rollout en cours.

Continuez avec les commande suivante afin de voir ce qui se passe en cas d'erreur :

```bash
kubectl get rs

kubectl set image deploy kuard kuard-amd64=gcr.io/kuar-demo/kuard-amd64:red
kubectl rollout status deploy kuard
kubectl rollout history deploy kuard
kubectl rollout undo deploy kuard

kubectl rollout pause deploy kuard
kubectl set image deploy kuard kuard-amd64=gcr.io/kuar-demo/kuard-amd64:purple
kubectl rollout history deploy kuard
kubectl rollout resume deploy kuard
```

### Exercice 10

Créez un DaemonSet, qui se déploiera sur tous les nodes.

```bash
kubectl apply -f ./2_replicas_set/2-fluentd-ds.yaml

# Affichez la liste des pods, vérifiez que les nodes indiqués sont bien différents
kubectl get pods -o wide
```

Créez un DaemonSet qui ne se déploiera que sur les nodes disposants du label `ssd=true`.

```bash
kubectl apply -f ./2_replicas_set/3-ssd-ds.yaml

kubectl get pods -o wide # Que constatez vous ? Comment régler le problème ?
```

<details>
<summary>Aide</summary>

```bash
kubectl label node <node> ssd=true
kubectl get pods -o wide
```

</details>

### Exercice 10.1

Démarrez un job seul, via une commande :

```bash
kubectl run -i oneshot \
--image=gcr.io/kuar-demo/kuard-amd64:blue \
--restart=OnFailure \
-- --keygen-enable \
--keygen-exit-on-complete \
--keygen-num-to-gen=10
```

Vérifiez la présence de l'objet Job via `kubectl get jobs`, puis des pods via `kubectl get pods`.

Supprimer ce job (`kubectl delete job oneshot`), puis crééez un job via le fichier `./2_replicas_set/4-job-oneshot.yaml`.

Inspectez votre job et vos pods (`describe`, `get` et `logs`).

Enfin, pour comparer, appliquez le fichier `./2_replicas_set/5-job-oneshot-failure1.yaml`.
Inspectez le job et le pod créé.

Faites un peu de ménage (via `kubectl delete -f`). Appliquez ensuite le fichier `./2_replicas_set/6-job-parallel.yaml`.
Utilisez ensuite la commande `kubectl get pods -w`, observez le comportement des pods.

Nous allons ensuite créer des jobs, alimentés par une queue de travail (présente dans un pod kuard)

```bash
kubectl apply -f ./2_replicas_set/7-rs-queue.yaml
kubectl apply -f ./2_replicas_set/8-service-queue.yaml

QUEUE_POD=$(kubectl get pods -l app=work-queue,component=queue \
-o jsonpath='{.items[0].metadata.name}')
kubectl port-forward pod/$QUEUE_POD 8080:8080 # Gardez cette commande active !

# Dans un autre terminal, exécutez :
./2_replicas_set/9-load-queue.sh
curl localhost:8080/memq/server/stats

kubectl apply -f ./2_replicas_set/10-job-consumer.yaml
```


Section suivante, [la configuration et les secrets](5_configmaps_and_secrets.md).