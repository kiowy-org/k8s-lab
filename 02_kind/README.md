# KIND : Kubernetes IN Docker

Dans ce TP, nous allons installer kind, afin de créer un cluster sur notre machine. 
Contrairement à un cluster de production, qui nécessiterait des VMs ou des machines physiques, KIND utilise des conteneurs afin de jouer le rôle des Nodes de votre Cluster.

## 1. Procédure d'installation

Installons KIND depuis le binaire :
```shell
{
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
}

