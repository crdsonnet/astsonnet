.PHONY: docs
docs:
	rm -rf docs/
	jsonnet \
		-J generator/vendor \
		-S -c -m docs \
		-e '(import "github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet").render(import "main.libsonnet")'

.PHONY: fmt
fmt:
	@find . -path './.git' -prune -o -name 'vendor' -prune -o -name '*.libsonnet' -print -o -name '*.jsonnet' -print | \
		xargs -n 1 -- jsonnetfmt --no-use-implicit-plus -i

.PHONY: gen
gen:
	@jsonnet -S -J generator/vendor generator/generate.jsonnet | jsonnetfmt - > new.libsonnet
