all: serve

serve:
	Rscript -e "blogdown::serve_site()"

build:
	Rscript -e "blogdown::hugo_build()"

deploy: build
	rsync -zrvce 'ssh -p 18765' public/ stuartle@sgp37.siteground.asia:public_html


plyranges:
	Rscript -e "pkgdown::clean_site('~/plyranges'); pkgdown::build_site('~/plyranges')"
	cp -rf ~/plyranges/docs/ static/plyranges

clean:
	rm -rf public
	rm -rf blogdown