.DEFAULT_GOAL := build_all

USERNAME = $$(grep USER docker/.env | awk -F"=" '{print $$2}')

build_all: build_ui build_comment build_post build_prometheus

build_ui:
	docker build -t $(USERNAME)/ui src/ui/

build_comment:
	docker build -t $(USERNAME)/comment src/comment/

build_post:
	docker build -t $(USERNAME)/post src/post-py/

build_prometheus:
	docker build -t $(USERNAME)/prometheus monitoring/prometheus/

push_all: push_ui push_comment push_post push_prometheus

push_ui:
	docker push $(USERNAME)/ui

push_comment:
	docker push $(USERNAME)/comment

push_post:
	docker push $(USERNAME)/post

push_prometheus:
	docker push $(USERNAME)/prometheus
