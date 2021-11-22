# Docker et la conteneurisation

Dans ce TP, nous allons utiliser Docker afin de manipuler les conteneurs.

## Installation de Docker

Si vous ne disposez pas encore de Docker sur votre machine, commencons par l'installer.
La procédure d'installation pour Ubuntu est décrite ci-dessous, vous pouvez également vous renseingner sur la [documentation officielle de Docker](https://docs.docker.com/engine/install/ubuntu/).

```shell
{
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
}
```

Si tout s'est bien passé, vérifiez l'installation en exécutant `sudo docker run hello-world`.

## 2. Commandes importantes

Afin de réaliser les exercices sur le support de formation, voici quelques commandes principales :

```shell
docker run <IMAGE> # Démarre un conteneur avec l'image <IMAGE>
docker ps [-a] # Liste les conteneurs actifs (-a affiche également les conteneurs arretés)
docker exec -it <CONTENEUR> <CMD> # Exécute la commande <CMD> dans le conteneur <CONTENEUR> de manière intéractive (grâce à -it)

```

## Exercice 1.1

Démarrer un conteneur en mode daemon avec le nom “mariadbtest” qui exécute une instance de MariaDB (image Docker officielle). 

Regardez les options des commandes : `docker run -h`

## Exercice 1.2

Installez vim dans le conteneur mariadbtest.

## Exercice 2

Remplisez le Dockerfile présent dans le dossier `2_docker_flask`.

Les étapes suivantes sont nécessaires pour faire fonctionner le serveur, à vous de traduire via la [syntaxe Dockerfile](https://docs.docker.com/engine/reference/builder/).

```
Utilisez l’image alpine:3.5 comme base
Installez pip via la commande “apk add --update py2-pip”
Copiez le fichier requirements.txt dans /usr/src/app
Installez les dépendances via pip install --no-cache-dir -r /usr/src/app/requirements.txt
Copiez app.py et templates/ dans /usr/src/app
La commande qui démarre le serveur est “python /usr/src/app/app.py”
Le serveur écoute sur le port 5000 par défaut
```

## Exercice 3

En utilisant les fichiers dans le dossier `3_docker_volume`, exécutez le serveur en montant le fichier de template dans votre conteneur.

## Exercice 4

Dans cette question finale, nous allons créer un conteneur de Kuard via la procédure de build multistage [documentée ici](https://github.com/kubernetes-up-and-running/kuard#multi-stage-dockerfile).

