.PHONY: up down pull logs ps clean

# Démarre la stack complète
up:
	docker compose up -d

# Démarre avec rebuild des images locales
up-build:
	docker compose up -d --build

# Arrête la stack
down:
	docker compose down

# Récupère les dernières images depuis GHCR
pull:
	docker compose pull

# Logs en temps réel
logs:
	docker compose logs -f

# État des containers
ps:
	docker compose ps

# Nettoyage complet (volumes inclus)
clean:
	docker compose down -v --remove-orphans
