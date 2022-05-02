## 5. ConfigMaps et Secrets

### Exercice 11

Commencez par créer un configmap incluant un fichier de config, et des paramètres.

```bash
kubectl create configmap my-config \
--from-file=./3_configmaps_and_secrets/1-simple-config.txt \
--from-literal=extra-param=extra-value \
--from-literal=another-param=another-value
```

Inspectez ensuite ce configmap afin d'en afficher les valeurs

```bash
kubectl get cm
kubectl describe cm my-config
kubectl get cm my-config -o yaml
```

Enfin, créez un pod qui utilise ce configmap.

```bash
kubectl apply -f ./3_configmaps_and_secrets/2-kuard-config.yaml
```

Vérifiez dans kuard les valeurs présentes dans l'environnement et sur le filesystem.

### Exercice 12

Créez un secret contenant un certificat, et montez le dans kuard.

Commencez par récupérer les fichiers de certificat.

```bash
curl -o kuard.crt https://storage.googleapis.com/kuar-demo/kuard.crt
curl -o kuard.key https://storage.googleapis.com/kuar-demo/kuard.key
```

Puis, utilisez kubectl pour créer un secret à partir des fichiers.

```bash
kubectl create secret generic kuard-tls \
--from-file=kuard.crt \
--from-file=kuard.key
```

Affichez les données du secret, que constatez vous ?

<details>
<summary>Aide</summary>

```bash
kubectl get secret
kubectl describe secret
```

</details>

Créez un Pod utilisant ce secret, vérifiez le résultat dans kuard

```bash
kubectl apply -f ./3_configmaps_and_secrets/3-kuard-secret.yaml
```

Section suivante, [les Statefulsets](6_statefulsets.md)