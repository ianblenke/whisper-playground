run:
	docker pull ubuntu:22.04
	docker-compose build whisper_playground_backend whisper_playground_frontend
	docker-compose up --force-recreate -d
	docker-compose logs -f
