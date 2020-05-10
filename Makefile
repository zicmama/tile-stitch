CC := $(CC)
CXX := $(CXX)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)

CURL_CFLAGS := $(shell pkg-config --cflags libcurl)
PNG_CFLAGS := $(shell pkg-config --cflags libpng)
CURL_LIBS := $(shell pkg-config --libs libcurl) -lcurl
PNG_LIBS := $(shell pkg-config --libs libpng)

stitch: stitch.c
	$(CC) -I /usr/include/geotiff -g -Wall -O3 $(CFLAGS) $(LDFLAGS) -o stitch stitch.c $(CURL_CFLAGS) $(PNG_CFLAGS) $(JPEG_CFLAGS) $(CURL_LIBS) $(PNG_LIBS) $(JPEG_LIBS) -ljpeg -lm -lgeotiff -ltiff

clean:
	rm -f stitch

indent:
	clang-format -i -style="{BasedOnStyle: Google, IndentWidth: 8, UseTab: Always, AllowShortIfStatementsOnASingleLine: false, ColumnLimit: 0, ContinuationIndentWidth: 8, SpaceAfterCStyleCast: true, IndentCaseLabels: false, AllowShortBlocksOnASingleLine: false, AllowShortFunctionsOnASingleLine: false, SortIncludes: false}" stitch.c
