# devops-infra

Repo d'infrastructure centrale — orchestre la stack complète (backend Spring Boot + frontend Angular MFE) via Docker Compose et Traefik.

> **Objectif :** montrer comment déployer un système multi-services avec un reverse proxy, sans avoir à cloner les repos applicatifs. Les images sont tirées depuis GHCR.

---

## Architecture déployée

```
                      :80
                       │
              ┌────────▼────────┐
              │     Traefik     │  reverse proxy + routing par Host header
              └────────┬────────┘
           ┌───────────┼───────────┐
           │           │           │
    app.localhost  api.localhost  remote.localhost
           │           │           │
    ┌──────▼──┐  ┌─────▼──┐  ┌───▼────────┐
    │  Shell  │  │  API   │  │  Remote    │
    │ Angular │  │ Spring │  │  Angular   │
    └─────────┘  └────────┘  └────────────┘
```

---

## Prérequis

- Docker 24+
- Docker Compose v2

---

## Démarrage rapide / Quick start

```bash
# 1. Copier le fichier d'environnement
cp .env.example .env

# 2. Récupérer les images
make pull

# 3. Démarrer la stack
make up
```

Accès :
- Application : `http://app.localhost`
- API : `http://api.localhost`
- Dashboard Traefik : `http://localhost:8088`

---

## Commandes disponibles

| Commande | Action |
|---|---|
| `make up` | Démarre la stack |
| `make down` | Arrête la stack |
| `make pull` | Met à jour les images |
| `make logs` | Affiche les logs |
| `make ps` | État des containers |
| `make clean` | Supprime tout (volumes inclus) |

---

## Configuration

Les variables d'environnement sont dans `.env` (copier depuis `.env.example`). En production, passer par des secrets Docker ou Vault.

---

## Repos liés

| Repo | Rôle |
|---|---|
| [devops-spring-app](https://github.com/A-Djihadi/devops-spring-app) | Backend Java/Spring Boot |
| [devops-angular-mfe](https://github.com/A-Djihadi/devops-angular-mfe) | Frontend Angular MFE |
| [devops-kubernetes](https://github.com/A-Djihadi/devops-kubernetes) | Déploiement Kubernetes |
| [devops-ansible](https://github.com/A-Djihadi/devops-ansible) | Provisioning serveur |

---

*Auteur : [Djihadi Ahamdy](https://djihadi.dev)*
