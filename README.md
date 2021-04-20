# Opendistro Develop

Progetto per lo sviluppo su Open Distro di Amazon

## Pre-Requisiti

Il progetto è basato sull'esecuzione dei processi all'interno di docker, quindi sarà necessario avere installato sulla propria macchia il seguente software:

- docker
- docker-compose

Su macchine windows può essere installato [Docker Desktop](https://docs.docker.com/docker-for-windows/install/)

## Preparazione Ambiente
Per prima cosa scaricare i files del progetto o tramite la **clone** di git, oppure scaricando direttamente da Web lo zip del progetto

Una volta che i files sono stati copiati sul proprio PC, da shell unix spostarsi all'interno della directory *bin* ed eseguire il comando **init.sh**

Questo comando creerà l'imagine docker per la compilazione dei sorgenti dei plugins

Se si utilizza windows, bisognerà utilizzare il command prompt per lanciare dalla directory *bin* i comando **init.bat**

Terminata la creazione dell'immagine docker, ci vorrà parecchio tempo, si può avviare l'ambiente di esecuzione di Open Distro, eseguento il comando **start.sh** o **start.bat** a seconda se si utilizza un sistema linux/unix o ms-windows

Una volta avviati i container del runtime di Open-Distro, sarà possibile collegarsi a kibana tramite il seguente URL http://localhost:5601 
Per autenticarsi si dovrà inserire sia come username che come password **admin**

## Sviluppo plugins 
La directory di lavoro per sviluppare i plugins è **storage/plugins** al cui interno verranno memorizzati e gestiti i sorgenti dei vari plugins.

In tale directory possono essere copiati i sorgenti di plugins già disponibili o crearne dei nuovi. **IMPORTANTE:** il sorgente di ogni plugin deve essere contenuto in una sua sotto-directory

Per poter creare un plugin da zero, si può utilizzare il tool messo a disposizione da Kibana [Automatic generator](https://www.elastic.co/guide/en/kibana/master/plugin-tooling.html#automatic-plugin-generator) spostandosi all'interno della directory **bin** ed eseguendo il comando **create-empty-plugin.sh** o **create-empty-plugin.bat** a seconda del sistema operativo utilizzato
Una volta lanciato chiederà alcune informazioni riguardanti il plugin che si vuole creare (a meno del nome potete lasciare le risposte di default), dopodichè verrà creata la corispettiva directory ed i sorgenti all'interno di **storage/plugins**

### Compilazione Plugin
Per poter compilare i plugins presenti nella directory **storage/plugins**, spostarsi nella directory **bin** ed eseguire il comando **plugin-build.sh** o **plugin-build.bat** a seconda del sistema operativo

Alla fine della compilazione, in caso di esito positivo, in ogni directory di plugin sarà stata creata una sotto-directory **build** con un file .zip che sarà utilizzato per la distribuzione e l'installazione del plugin.

**NOTA:** lo script **plugin-build.sh** compila **TUTTI** i plugin presenti nella directory **storage/plugins**

## Installazione Plugins
Per installare i plugins nell'ambiente di esecuzione di Open Distro, per prima cosa bisogna assicurarsi che l'ambiente sia attivo, lanciando da dentro la directory *bin* il comando **check.sh**
E' importante che il container **odfe-kibana** sia **UP**

Se il Kibana risulta attivo, si può procedere con l'installazione dei plugins tramite il comando **install-plugins.sh** il quale installerà tutti i plugins presenti nella directory **storage/plugin** e riavvierà il container **odfe-kibana** per rendere effettiva l'installazione


