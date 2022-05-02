## 0. Prérequis

Afin de réaliser les différents exercices de la formation, vous aurez besoins d'outils ! Suivez les instructions ci-dessous pour mettre en place votre environnement.

Si ce n'est pas déjà le cas, installez les éléments suivants sur votre machine :
* Git
* Un éditeur de texte comme `vi` ou `nano` peut suffire, mais pour le confort je vous recommande d'installer (VSCode)[https://code.visualstudio.com/] ou un éditeur léger équivalent (Sublimetext), qui supporte bien la syntaxe yaml. Sachez également que les IDE plus lourds (Intellij de Jetbrains et Eclipse) proposent des plugins très utiles pour travailler avec Kubernetes.

### Kubectl

Vous devez installer l'outil ligne de commande de kubernetes appelé `kubectl`. Pour cela, rendez vous sur https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ et suivez les instructions correspondantes à votre os.

Pour valider que l'installation fonctionne, tapez la commande `kubectl version --client`. Vous devez obtenir une sortie similaire à celle-ci :

```
Client Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.3", GitCommit:"816c97ab8cff8a1c72eccca1026f7820e93e0d25", GitTreeState:"clean", BuildDate:"2022-01-25T21:17:57Z", GoVersion:"go1.17.6", Compiler:"gc", Platform:"darwin/amd64"}
```

Assurez vous simplement que GitVersion soit à 1.23.X

### Accès au cluster

Une fois la cli `kubectl` installé, vous devez lui indiquer comment se connecter au cluster Kubernetes. Pour la formation, un cluster a été créé pour vous sur Google Cloud (distribution Google Kubernetes Engine).

Vous devez indiquer à kubectl à minima l'adresse du cluster, ainsi que les informations d'identification. Pour cela, récupérez le fichier de configuration (`config`) donné lors de la formation. Vous devrez ensuite copier ce fichier dans le dossier `$HOME/.kube/`. 

Une fois copié, vous devez donc avoir le fichier présent au chemin suivant : `$HOME/.kube/config`.

Vérifiez que votre accès fonctionne via la commande `kubectl get ns`. Vous devriez voir une liste apparaitre.

**IMPORTANT : Pour terminer la mise en place, exécutez les commandes suivantes**

Afin de travailler sans géner les autres, vous allez vous créer un namespace à vous :

1. Choissisez un nom unique (votre prénom par exemple, mettez vous d'accord avec vos homonymes).
2. Exécutez la commande `kubectl create namespace <prenom>`
3. Exécutez la commande `kubectl config --current --namespace=<prenom>`

Voilà, désormais si vous exécutez une commande `kubectl`, celle-ci sera exécutée par défaut dans votre namespace !

### BONUS : Quelques outils pour la vie de tous les jours avec kubectl

* L'aide mémoire kubectl, qui vous permet notamment d'installer l'autocomplétion : https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/
* N'oubliez pas également l'alias `k=kubectl`, pour ne pas taper `kubectl` trop souvent !
* Pour ceux qui aiment la couleur, (kubecolor)[https://github.com/hidetatz/kubecolor] vous permet de mettre en couleur les commandes kubectl dans votre terminal
* Pour les fans de GUI : Kubernetes ne dispose plus par défaut d'une interface graphique, je vous conseil le projet (k9s)[https://k9scli.io/] qui est un GUI dans le terminal.
* Si vous préferez un GUI natif, regardez du coté de (lens)[https://k8slens.dev/]

Sections suivante, (les Pods)[1_pods.md].