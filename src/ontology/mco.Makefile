## Customize Makefile settings for mco
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# ----------------------------------------
# Mirroring upstream ontologies
# ----------------------------------------

# MCO will try to extract modules directly from full NCBITaxon

## ONTOLOGY: ncbitaxon
## Copy of ncbitaxon is re-downloaded whenever source changes

mirror/ncbitaxon.trigger: $(SRC)

mirror/ncbitaxon.owl: mirror/ncbitaxon.trigger
	@if [ $(MIR) = true ] && [ $(IMP) = true ]; then $(ROBOT) convert -I $(URIBASE)/ncbitaxon.owl -o $@.tmp.owl && mv $@.tmp.owl $@; fi

.PRECIOUS: mirror/%.owl

	

# ----------------------------------------
# Import modules
# ----------------------------------------

#  MCO uses MIREOT modules, except for CHEBI module which is BOT. These series of target rules could be condensed
# with a conditional statement, which I cannot do for lack of knowledge on Makefiles.



imports/ncbitaxon_import.owl: mirror/ncbitaxon.owl imports/ncbitaxon_terms_combined.txt imports/ncbitaxon_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/ncbitaxon_upper_terms.txt -L imports/ncbitaxon_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/micro_import.owl: mirror/micro.owl imports/micro_terms_combined.txt imports/micro_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/micro_upper_terms.txt -L imports/micro_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/bfo_import.owl: mirror/bfo.owl imports/bfo_terms_combined.txt imports/bfo_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/bfo_upper_terms.txt -L imports/bfo_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/cl_import.owl: mirror/cl.owl imports/cl_terms_combined.txt imports/cl_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/cl_upper_terms.txt -L imports/cl_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/clo_import.owl: mirror/clo.owl imports/clo_terms_combined.txt imports/clo_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/clo_upper_terms.txt -L imports/clo_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/efo_import.owl: mirror/efo.owl imports/efo_terms_combined.txt imports/efo_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/efo_upper_terms.txt -L imports/efo_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/peco_import.owl: mirror/peco.owl imports/peco_terms_combined.txt imports/peco_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/peco_upper_terms.txt -L imports/peco_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/ncit_import.owl: mirror/ncit.owl imports/ncit_terms_combined.txt imports/ncit_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/ncit_upper_terms.txt -L imports/ncit_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

imports/npo_import.owl: mirror/npo.owl imports/npo_terms_combined.txt imports/npo_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/npo_upper_terms.txt -L imports/npo_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

imports/obi_import.owl: mirror/obi.owl imports/obi_terms_combined.txt imports/obi_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/obi_upper_terms.txt -L imports/obi_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

imports/omit_import.owl: mirror/omit.owl imports/omit_terms_combined.txt imports/omit_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/omit_upper_terms.txt -L imports/omit_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

imports/omp_import.owl: mirror/omp.owl imports/omp_terms_combined.txt imports/omp_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/omp_upper_terms.txt -L imports/omp_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/pato_import.owl: mirror/pato.owl imports/pato_terms_combined.txt imports/pato_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/pato_upper_terms.txt -L imports/pato_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

imports/sio_import.owl: mirror/sio.owl imports/sio_terms_combined.txt imports/sio_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/sio_upper_terms.txt -L imports/sio_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl


imports/uberon_import.owl: mirror/uberon.owl imports/uberon_terms_combined.txt imports/uberon_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/uberon_upper_terms.txt -L imports/uberon_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

imports/zeco_import.owl: mirror/zeco.owl imports/zeco_terms_combined.txt imports/zeco_upper_terms.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -U imports/zeco_upper_terms.txt -L imports/zeco_terms_combined.txt --force true --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/%_import.owl

