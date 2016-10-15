# swiftdom
DOM data extraction package inspired by BeautifulSoup in pure swift

Setup libxml2:

	cd libxml2
	git init
	git add *
	git commit -m "initial commit"
	git tag 1.0.0
	cd ..
	
	(or run libxml2/config.sh)

Build:

	swift build -Xcc -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/libxml2/
	
	(or run build.sh)

Run:

	.build/debug/swiftdom