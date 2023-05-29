.DEFAULT_GOAL := all

.PHONY: bootstrap-borg all

DRONES_DIR := $(HOME)/.emacs.d/site-lisp/pkg

DRONES := $(patsubst %,build/%,$(shell ls "$(DRONES_DIR)"))

-include $(DRONES_DIR)/borg/borg.mk

bootstrap-borg:
	@git submodule--helper clone --name borg --path $(DRONES_DIR)/borg \
	--url https://github.com/emacscollective/borg.git
	@cd $(DRONES_DIR)/borg; git symbolic-ref HEAD refs/heads/main
	@cd $(DRONES_DIR)/borg; git reset --hard HEAD

all: $(DRONES)
