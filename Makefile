SRC=index.org

all: index.html

index.html: $(SRC)
	nix-shell --pure --command 'orgdapp-doc $(SRC) $@'
