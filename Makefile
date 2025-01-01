.PHONY: docker publish example

build: Dockerfile
	docker build -t ozmoo .

publish: docker
	docker image tag ozmoo tkers/ozmoo
	docker image push tkers/ozmoo

# example usage below

Z3=thornfell.z3
C64=dist/c64_thornfell.d64
example: $(C64)

$(C64): $(Z3)
	docker run --rm -v "$(PWD)/dist":/data ozmoo \
	-bgcol:black -fgcol:white -statuscol:pur -inputcol:lblue -cursorcol:lblue \
	-dmbgcol:white -dmfgcol:black -dmstatuscol:lblue -dminputcol:pur -dmcursorcol:pur \
	-cb:50 -cs:b -sw:0 -ch:1 -fn:thornfell -dt:THORNFELL -t:c64 \
	$(Z3)
