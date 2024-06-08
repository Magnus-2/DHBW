## Service-Account Configdatei (Muster) 
Der "token" kann innerhalb von kubectl mit diesem befehl erzeugt werden
```cmd
kubectl create token Service-Account-Name
```
```YAML 
apiVersion: v1
clusters:
- cluster:
# The two following credentials can be copied from Kubeconfig from the Stackit Webservice 
    certificate-authority-data: aghghsggfghgghgahsioerpqtebtpöqenhrpothqepiotjhqriopzjpiohjnqweprzh
    server: https://api.asdfasdf.asdf00asdf000.s.ske.eu01.onstackit.cloud
  name: Cluster-Namer
contexts:
- context:
    cluster: Cluster-Name
    namespace: Namespace-Name
    user: Username
  name: Context-Name
current-context: Context-Name
kind: Config
preferences: {}
users:
- name: Username
  user:
    token:
```



## Service-Account (Muster) 

Dieser Service-Account funktioniert nur innerhalb der Kubernetes-Cluster ist kein StackIT Service-Account
```YAML
# service-account.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: ServiceAccount-Name
  namespace: Namespace-Name
```



## Rollenbindung (Muster) 

Rollen haben leider keine Wirkung auf Accounts die von StackIT (kubeconfig) sind 
Deshalb benötigen wir in der Rollenbindung und später in der Role den oben beschriebenen Service-Account 
```YAML
# rolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: RoleBinding-Name
  namespace: Namespace-Name
subjects:
- kind: ServiceAccount
  name: ServiceAccount-Name 
  namespace: Namespace-Name # Shout be the same as above 
roleRef:
  kind: Role
  name: Role-Name
  apiGroup: rbac.authorization.k8s.io
```




## Rollen (Muster)
Rollen sind immer Namespace spezifisch. Falls der Standart-Namespace verwendet werden soll "default" eintragen
```YAML
# role.yaml 
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: Namespace-Name
  name: ServiceAccount-Name
rules:
###########################
### all rule options ######
###########################
- apiGroups: [""]
  resources: ["pods", "pods/log", "services", "endpoints", "persistentvolumeclaims", "configmaps", "secrets"]
  verbs: ["get", "list", "watch", "create", "update"]
 - apiGroups: ["apps"]
   resources: ["deployments", "daemonsets", "replicasets", "statefulsets"]
   verbs: ["get", "list", "watch", "create", "update", "delete"]
 - apiGroups: ["batch"]
   resources: ["jobs", "cronjobs"]
   verbs: ["get", "list", "watch", "create", "update", "delete"]
 - apiGroups: ["extensions"]
   resources: ["deployments", "ingresses"]
   verbs: ["get", "list", "watch", "create", "update", "delete"]
 - apiGroups: [""]
   resources: ["nodes"]
   verbs: ["none"]

```

