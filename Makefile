deps:
	rm -rf bootstrap
	mkdir -p bootstrap	
	git clone https://github.com/twbs/bootstrap ./bootstrap
	npm install -d
	
build:
	mkdir -p build/js
	mkdir -p build/css
	@./node_modules/.bin/uglifyjs --comments \
		-o build/js/bootstrap-datetimepicker.min.js \
	       	src/js/bootstrap-datetimepicker.js
	@./node_modules/.bin/lessc --yui-compress --include-path=bootstrap/less\
	       	src/less/bootstrap-datetimepicker.less \
	       	build/css/bootstrap-datetimepicker.min.css

test: build
	@./test/run.sh

clean:
	rm -rf build

.PHONY: deps build clean test
