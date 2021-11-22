# KIND : Kubernetes IN Docker

Dans ce TP, nous allons installer kind, afin de créer un cluster sur notre machine. 
Contrairement à un cluster de production, qui nécessiterait des VMs ou des machines physiques, KIND utilise des conteneurs afin de jouer le rôle des Nodes de votre Cluster. 

## 0. Installation de kubectl
Avant de commencer l'installation de KIND, nous allons installer kubectl.
kubectl est l'outil en ligne de commande de Kubenetes. Il nous permettra de manipuler les objets contenus dans le cluster.

```shell
{
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.4/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    kubectl version --client
}
```

Résultat :
```
Client Version: version.Info{Major:"1", Minor:"22", GitVersion:"v1.22.4", ...
```

## 1. Installation de KIND

Installons KIND depuis le binaire :
```shell
{
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
}
```

Une fois la CLI Kind installée, créez un cluster Kubernetes avec la commande suivante (le fichier `cluster-config.yaml` est dans le dossier `02_kind`) :

```shell
kind create cluster --config cluster-config.yaml
```