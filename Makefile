PY?=python

GITHUB_PAGES_BRANCH=gh-pages
OUTPUTDIR=output

github:
	mkdir -p $(OUTPUTDIR)
	mkdir -p $(OUTPUTDIR)/notebooks
	touch $(OUTPUTDIR)/.nojekyll
	cp *.html $(OUTPUTDIR)
	cp *.pdf $(OUTPUTDIR)
	cp *.ipynb $(OUTPUTDIR)/notebooks
	python make_index.py $(OUTPUTDIR) --header "Cours Python LIESSE @ Télécom ParisTech"
	python make_index.py $(OUTPUTDIR)/notebooks --header "Notebooks cours Python LIESSE @ Télécom ParisTech"

	ghp-import -m "Generate Pelican site" -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR)
	git push origin $(GITHUB_PAGES_BRANCH)
