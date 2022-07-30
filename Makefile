.PHONY: textlint lint-text
textlint: lint-text
lint-text:
	@echo "running textlint..."
	@docker run -t --rm -v $$PWD:/work -w /work ghcr.io/sacloud/textlint-action:v0.0.3 .
