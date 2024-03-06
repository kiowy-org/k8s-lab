# Formation Kubernetes - Lab

Bienvenue dans le lab de cette formation Kubernetes. Dans ce dépôt vous trouverez l'ensemble des TPs avec les instructions.

Pour commencer, démarrez par les [pré-requis](0_prerequis.md).


```bash
kubectl port-forward -n argocd svc/argocd-server 4590:443
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
