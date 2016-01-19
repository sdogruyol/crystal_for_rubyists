CHAPTERS=book/preamble.md \
				 $(sort $(wildcard book/chapter-*.md))

CONTENTS=book/title.txt \
				 $(CHAPTERS)

ALL_FILES=$(CHAPTERS) \
					book/metadata.xml \
					book/title.txt \
					cover.png

EPUB_OPTS=--toc --smart --epub-cover-image=cover.png --epub-metadata=book/metadata.xml

HTML_OPTS=--smart --to=html5 --template=book/template.html

CLEAN_FILES=$(patsubst %.md,%.html,$(wildcard book/chapter-*.md)) \
						crystal-for-rubyists.epub \
						crystal-for-rubyists.pdf \
						crystal-for-rubyists.mobi \
						*.tgz

all: crystal-for-rubyists-epub.tgz crystal-for-rubyists-pdf.tgz crystal-for-rubyists-mobi.tgz site

crystal-for-rubyists.epub: $(ALL_FILES)
	pandoc $(EPUB_OPTS) -o $@ $(CONTENTS)

crystal-for-rubyists.pdf: $(ALL_FILES)
	pandoc $(EPUB_OPTS) -o $@ $(CONTENTS)

crystal-for-rubyists.mobi: crystal-for-rubyists.epub
	kindlegen crystal-for-rubyists.epub

book/book.html: $(CHAPTERS)
	pandoc -o $@ $(HTML_OPTS) $(CHAPTERS)

book/%.html : book/%.md
	pandoc -o $@ $(HTML_OPTS) $<

site: $(patsubst %.md,%.html,$(wildcard book/chapter-*.md)) book/book.html

code.tgz: code
	tar cf code.tgz code

crystal-for-rubyists-epub.tgz: crystal-for-rubyists.epub code.tgz
	tar cf $@ $< code.tgz

crystal-for-rubyists-pdf.tgz: crystal-for-rubyists.pdf code.tgz
	tar cf $@ $< code.tgz

crystal-for-rubyists-mobi.tgz: crystal-for-rubyists.mobi code.tgz
	tar cf $@ $< code.tgz

ship: all
	git push origin
	s3deploy

.PHONY: clean

clean:
	rm -f $(CLEAN_FILES)
