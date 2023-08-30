# Grafana Dashboards with Jsonnet

The repository contains dashboard examples written in Jsonnet.

# Run Grafana instance

First, you need a running instance of Grafana(see below)

Run the Grafana Docker container
Start the Docker container by binding Grafana to external port 3000.

```bash
docker run -d -p 3000:3000 --name grafana grafana/grafana-oss
docker ps
```

Try it out, default admin user credentials are admin/admin.

Further documentation can be found at http://docs.grafana.org/installation/docker/.

# Run Grafana container with persistent storage (recommended)
```bash
# Remove if exists
docker container rm grafana
docker image rm grafana/grafana-oss
docker volume rm grafana-storage

# create a persistent volume for your data in /var/lib/grafana (database and plugins)
docker volume create grafana-storage

# start grafana
docker run --name grafana \
  -d \
  -p 3000:3000 \
  -v grafana-storage:/var/lib/grafana \
  --network jsonnet-tutorial-net \
  grafana/grafana-oss
```

## Open Grafana Web Console

Go to [Grafana Admin Panel](http://localhost:3000)

Use admin/admin as username/password while authenticating.

After the login, the UI will ask for a new password. Please, use `admin` value. It is used inside the scripts.


# Demo Time

If you have a running instance of Grafana, just run a command

```shell
./bin/deploy-dashboard.sh dashboards/dashboard-templates.jsonnet 
```

You can select any dashboard example from the directory `./dashboards`

## How to deploy a dashboard

```shell
# make a script executable if necessary
chmod +x ./bin/deploy-dashboard.sh

# deploy a dashboard
./bin/deploy-dashboard.sh ./dashboards/simple.jsonnet

```

Open Grafana http://localhost:3000/d/dashboard

