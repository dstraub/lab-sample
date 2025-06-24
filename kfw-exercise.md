Aufgabe: Der Webserver-Container `registry.straubcloud.de/webserver` soll dem Hostnamen `webserver.apps.ocp4.example.com` bereitgestellt werden.  
Für alle notwendigen Openshift-Resourcen sollen Manifest-Dateien verwendet werden, die während der Übung erweitert werden.

- Projekt anlegen: `oc new-project webserver`

- Initiale Manifeste erzeugen
```
oc create deployment webserver --image registry.straubcloud.de/webserver --port 8080 --dry-run=client -o yaml > deployment.yml

oc create service clusterip webserver --tcp 80:8080 --dry-run=client -o yaml > service.yml

oc create route edge webserver --hostname webserver.apps.ocp4.example.com --service webserver --port 80 --dry-run=client -o yaml > route.yml
```

- Best-Practice:  für den verwendeten Port im Deployment/Service/Route soll ein Name (http) verwendet werden

- Das Deployment soll eine Umgebungsvariable "COURSE=DO288" verwenden.

- Manifeste anwenden: `oc apply -f .` 
  Prüfen ob die Anwendung fehlerfrei bereit gestellt ist.  

- Anwendung von "innen nach aussen" testen
```
- im Container direkt: curl locallhost:8080
- im Container über den Service: curl webserver
- von der Workstation: curl https://webserver.apps.ocp4.example.com
```

- Erzeugen eines Manifest für eine leere ConfigMap mit Namen `webserver-env` 
```
oc create configmap webserver-env --dry-run=client -o yaml > webserver-env.yml
```

- Das Manifest der ConfigMap erweitern um  eine `data`-Dictionary, unter dem Schlüssel `env.properties` soll folgender Textblock enhthalten sein:
```
  location: Berlin
  lunch: 11:55
```

- Die ConfigMap bereit stellen und im Deployment unter dem Pfad `/usr/share/nginx/html/env.properties` verfügbar machen.  
  Dabei muss berücksichtigt werden, das in dem Verzeichnis noch weitere Dateien existieren.

- Optional: livenessProbe und readynessProbe für den Pod unter Verwendung des http-Endpunkts `/heathz` konfigurien.

- Optional: resource - requests/limits konfigurieren



