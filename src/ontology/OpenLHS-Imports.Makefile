## Customize Makefile settings for OpenLHS-Imports
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# Custom imports

## Module for ontology: obi

$(IMPORTDIR)/obi_import.owl: $(MIRRORDIR)/obi.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/obi_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT --intermediates none \
		remove -t NCBITaxon:314146 -t OBI:0000417 -t OBI:0000833 \
		filter -T $(IMPORTDIR)/obi_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/obi_clean.ru \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

## Module for ontology: iao

$(IMPORTDIR)/iao_import.owl: $(MIRRORDIR)/iao.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/iao_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT --intermediates none \
		filter -T $(IMPORTDIR)/iao_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

## Module for ontology: sepio

$(IMPORTDIR)/sepio_import.owl: $(MIRRORDIR)/sepio.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/sepio_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT --intermediates none \
		remove -t http://www.w3.org/ns/prov#Agent \
		filter -T $(IMPORTDIR)/sepio_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

## Module for ontology: ogms

$(IMPORTDIR)/ogms_import.owl: $(MIRRORDIR)/ogms.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/ogms_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT --intermediates none \
		filter -T $(IMPORTDIR)/ogms_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi


## Module for ontology: cco

$(IMPORTDIR)/cco_import.owl: $(MIRRORDIR)/cco.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/cco_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT --intermediates none \
		filter -T $(IMPORTDIR)/cco_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/cco_clean.ru \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

## Module for ontology: omrse

$(IMPORTDIR)/omrse_import.owl: $(MIRRORDIR)/omrse.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/omrse_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT --intermediates none \
		filter -T $(IMPORTDIR)/omrse_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

## Module for ontology: ro

$(IMPORTDIR)/ro_import.owl: $(MIRRORDIR)/ro.owl
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/ro_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method subset --intermediates none \
		filter -T $(IMPORTDIR)/ro_filter_terms.txt --select "self annotations" --trim false \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi


# Custom reports exported in csv rather than tsv

SPARQL_CSTM_EXPORTS_ARGS = $(foreach V,$(SPARQL_EXPORTS),-s $(SPARQLDIR)/$(V).sparql $(REPORTDIR)/$(V).csv)


.PHONY: custom_reports
custom_reports: $(EDIT_PREPROCESSED) | $(REPORTDIR)
ifneq ($(SPARQL_EXPORTS_ARGS),)
	$(ROBOT) query --use-graphs true -i $< $(SPARQL_CSTM_EXPORTS_ARGS)
endif

# Command for building doc without GitHub publish

build_docs:
	mkdocs build --config-file ../../mkdocs.yaml
