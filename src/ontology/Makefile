# ----------------------------------------
# Standard Constants
# ----------------------------------------
# these can be overwritten on the command line

OBO=http://purl.obolibrary.org/obo
ONT=mco
BASE=$(OBO)/$(ONT)
SRC=$(ONT)-edit.owl
RELEASEDIR=../..
ROBOT= robot
OWLTOOLS= owltools
USECAT= --use-catalog
SPARQLDIR = ../sparql

# ----------------------------------------
# Top-level targets
# ----------------------------------------

all: sparql_test all_imports $(ONT).owl $(ONT).obo
test: sparql_test all
prepare_release: all
	cp $(ONT).owl $(ONT).obo $(RELEASEDIR) &&\
	mkdir -p $(RELEASEDIR)/imports &&\
	cp imports/*{owl,obo} $(RELEASEDIR)/imports &&\
	git add $(RELEASEDIR)/imports/*{obo,owl} &&\
	(test -f subsets/*owl && cp subsets/*{owl,obo} $(RELEASEDIR)/subsets && git add $(RELEASEDIR)/subsets/* || echo "no subsets") &&\
	echo "Release files are now in $(RELEASEDIR) - now you should commit, push and make a release on github"

# ----------------------------------------
# Main release targets
# ----------------------------------------

# by default we use Elk to perform a reason-relax-reduce chain
# after that we annotate the ontology with the release versionInfo
$(ONT).owl: $(SRC)
	$(ROBOT)  reason -i $< -r ELK relax reduce -r ELK annotate -V $(BASE)/releases/`date +%Y-%m-%d`/$(ONT).owl -o $@
$(ONT).obo: $(ONT).owl
	$(ROBOT) convert -i $< -f obo -o $(ONT).obo.tmp && mv $(ONT).obo.tmp $@

# ----------------------------------------
# Import modules
# ----------------------------------------
# Most ontologies are modularly constructed using portions of other ontologies
# These live in the imports/ folder
# These can be regenerated with make all_imports

IMPORTS = bfo chebi cl clo efo peco ncit npo obi omit omp pato sio uberon zeco
IMPORTS_OWL = $(patsubst %, imports/%_import.owl,$(IMPORTS)) $(patsubst %, imports/%_import.obo,$(IMPORTS))

# Make this target to regenerate ALL
all_imports: $(IMPORTS_OWL)

# Use ROBOT, driven entirely by terms lists NOT from source ontology

imports/chebi_import.owl: mirror/chebi.owl imports/chebi_terms.txt
	$(ROBOT) extract -i $< -T imports/chebi_terms.txt --method BOT -O $(BASE)/$@ -o $@
.PRECIOUS: imports/chebi_import.owl

imports/bfo_import.owl: mirror/bfo.owl imports/bfo_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -L imports/bfo_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/bfo_import.owl

imports/cl_import.owl: mirror/cl.owl imports/cl_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/cl_terms.txt -L imports/cl_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/cl_import.owl

imports/clo_import.owl: mirror/clo.owl imports/clo_terms.txt imports/clo_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/clo_upper_terms.txt -L imports/clo_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/cl_import.owl

# imports/efo_import.owl: mirror/efo.owl imports/efo_terms.txt imports/efo_upper_terms.txt
# 	$(ROBOT) extract -i $< --method MIREOT -U imports/efo_upper_terms.txt -L imports/efo_terms.txt -O $(BASE)/$@ -o $@
# .PRECIOUS: imports/efo_import.owl

imports/peco_import.owl: mirror/peco.owl imports/peco_terms.txt imports/peco_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/peco_upper_terms.txt -L imports/peco_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/eo_import.owl

imports/ncit_import.owl: mirror/ncit.owl imports/ncit_terms.txt imports/ncit_upper_terms.txt
	$(ROBOT)  extract -i $< --method MIREOT -U imports/ncit_upper_terms.txt -L imports/ncit_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/ncit_import.owl

imports/npo_import.owl: mirror/npo.owl imports/npo_terms.txt imports/npo_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/npo_upper_terms.txt -L imports/npo_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/npo_import.owl

imports/obi_import.owl: mirror/obi.owl imports/obi_terms.txt imports/obi_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/obi_upper_terms.txt -L imports/obi_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/obi_import.owl

imports/omit_import.owl: mirror/omit.owl imports/omit_terms.txt imports/omit_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/omit_upper_terms.txt -L imports/omit_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/omit_import.owl

imports/omp_import.owl: mirror/omp.owl imports/omp_terms.txt imports/omp_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/omp_upper_terms.txt -L imports/omp_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/omp_import.owl

imports/pato_import.owl: mirror/pato.owl imports/pato_terms.txt imports/pato_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/pato_upper_terms.txt -L imports/pato_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/pato_import.owl

imports/sio_import.owl: mirror/sio.owl imports/sio_terms.txt imports/sio_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/sio_upper_terms.txt -L imports/sio_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/sio_import.owl

imports/uberon_import.owl: mirror/uberon.owl imports/uberon_terms.txt imports/uberon_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/uberon_upper_terms.txt -L imports/uberon_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/uberon_import.owl

imports/zeco_import.owl: mirror/zeco.owl imports/zeco_terms.txt imports/zeco_upper_terms.txt
	$(ROBOT) extract -i $< --method MIREOT -U imports/zeco_upper_terms.txt -L imports/zeco_terms.txt -O $(BASE)/$@ -o $@
.PRECIOUS: imports/zeco_import.owl

# we use owltools for making the obo file until: https://github.com/ontodev/robot/issues/64
imports/%_import.obo: imports/%_import.owl
	$(OWLTOOLS) $(USECAT) $< -o -f obo $@

# clone remote ontology locally, perfoming some excision of relations and annotations
mirror/%.owl: $(SRC)
	$(OWLTOOLS) $(OBO)/$*.owl --remove-annotation-assertions -l -s -d --remove-dangling-annotations  -o $@
.PRECIOUS: mirror/%.owl

# ----------------------------------------
# Release
# ----------------------------------------
# copy from staging area (this directory) to top-level
release: $(ONT).owl $(ONT).obo
	cp $^ $(RELEASEDIR) && cp imports/* $(RELEASEDIR)/imports

# ----------------------------------------
# Sparql queries: Q/C
# ----------------------------------------

# these live in the ../sparql directory, and have suffix -violation.sparql
# adding the name here will make the violation check live
VCHECKS = equivalent-classes trailing-whitespace owldef-self-reference xref-syntax nolabels

# run all violation checks
VQUERIES = $(foreach V,$(VCHECKS),$(SPARQLDIR)/$V-violation.sparql)
sparql_test: $(SRC)
	robot verify -i $< --queries $(VQUERIES) -O reports/

# ----------------------------------------
# Sparql queries: Reports
# ----------------------------------------

REPORTS = basic-report class-count-by-prefix edges xrefs obsoletes synonyms
REPORT_ARGS = $(foreach V,$(REPORTS),-s $(SPARQLDIR)/$V.sparql reports/$V.tsv)
all_reports: $(SRC)
	robot query -f tsv -i $< $(REPORT_ARGS)
