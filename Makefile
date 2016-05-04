help:
	@echo '                                                                                     		'
	@echo 'Makefile for api-manager                                                                 	'
	@echo '                                                                                     		'
	@echo 'Usage:                                                                               		'
	@echo '    make requirements                 install requirements for local development     		'
	@echo '    make clean                        delete generated byte code                 		'
	@echo '    make quality                      run PEP8 and Pylint                            		'
	@echo '    make validate                     Run Python unit tests and linting 	                	'
	@echo '                                                                                     		'

requirements:
	pip install -qr requirements/test.txt --exists-action w

clean:
	find . -name '*.pyc' -delete

test_scripts:
	cd scripts/aws && python -m pytest

validate_python:
	make clean
	make quality
	make test_scripts

quality:
	pep8 --config=.pep8 scripts/aws
	pylint --rcfile=.pylintrc scripts/aws

validate: validate_python

# Targets in a Makefile which do not produce an output file with the same name as the target name
.PHONY: help requirements clean validate_python quality fast_validate_python
