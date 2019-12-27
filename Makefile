EMACS ?= emacs

INIT_PACKAGES="(progn \
  (require 'package) \
  (push '(\"melpa\" . \"https://melpa.org/packages/\") package-archives) \
  (package-initialize) \
  (package-refresh-contents) \
    (unless (package-installed-p 'package-lint) \
    (package-install 'package-lint)) \
  )"

all: compile package-lint clean-elc

package-lint:
	${EMACS} -Q --eval ${INIT_PACKAGES} -batch -f package-lint-batch-and-exit diredfl.el

compile: clean-elc
	${EMACS} -Q -batch -f batch-byte-compile diredfl.el

clean-elc:
	rm -f f.elc

.PHONY:	all compile clean-elc package-lint
