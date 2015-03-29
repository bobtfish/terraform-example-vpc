.phoney: all

all: .terraform

.terraform:
	    terraform get
	    for i in $$(ls .terraform/modules/); do cd ".terraform/modules/$$i"; make; cd ../../../; done

clean:
	if [ -d .terraform ]; then for i in $$(ls .terraform/modules/); do cd ".terraform/modules/$$i"; make clean; cd ../../../; done; fi
	rm -fr .terraform

