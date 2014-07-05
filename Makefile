
all: VampireOfTheWorld.epub VampireOfTheWorld.mobi VampireOfTheWorld.pdf VampireOfTheWorld.md

VampireOfTheWorld.epub: 
	rm -f VampireOfTheWorld.epub
	zip -X0 VampireOfTheWorld.epub mimetype
	zip -Xur9D VampireOfTheWorld.epub META-INF/* OEBPS/*

VampireOfTheWorld.mobi: VampireOfTheWorld.epub
	rm -f VampireOfTheWorld.mobi
	ebook-convert VampireOfTheWorld.epub VampireOfTheWorld.mobi

VampireOfTheWorld.pdf: VampireOfTheWorld.epub
	rm -f VampireOfTheWorld.pdf
	ebook-convert VampireOfTheWorld.epub VampireOfTheWorld.pdf --embed-all-fonts --margin-left 24 --margin-top 24 --margin-right 24 --margin-bottom 24 --minimum-line-height 160

VampireOfTheWorld.md: VampireOfTheWorld.epub
	rm -f VampireOfTheWorld.md
	ebook-convert VampireOfTheWorld.epub VampireOfTheWorld.txt --txt-output-formatting=markdown --keep-links --keep-image-references
	cp -f VampireOfTheWorld.txt VampireOfTheWorld.md
	rm -f VampireOfTheWorld.txt
