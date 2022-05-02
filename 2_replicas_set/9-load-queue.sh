
# Create a work queue called 'keygen'
curl -X PUT localhost:8080/memq/server/queues/keygen

# Create 100 work items and load up the queue.
for i in work-item-{0..99}; do
  curl -X POST localhost:8080/memq/server/queues/keygen/enqueue \
    -d "$i"
done


kubectl apply -f 7-rs-queue.yaml
kubectl apply -f 8-service-queue.yaml

QUEUE_POD=$(kubectl get pods -l app=work-queue,component=queue \
-o jsonpath='{.items[0].metadata.name}')
kubectl port-forward $QUEUE_POD 8080:8080
# Garder ce terminal actif !

# Éxecuter 9-load-queue.sh
./9-load-queue.sh
curl 127.0.0.1:8080/memq/server/stats

kubectl apply -f 10-job-consumer.yaml