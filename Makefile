# Makefile for heartbeat
appname := Heartbeat

#CV_LIB_PATH := /usr/local/lib/
CXX := g++
RM := rm -f
#CXXFLAGS := -Wall -g -std=c++11 -I/usr/local/lib
CXXFLAGS := -Wall -g -std=c++11 -I/usr/local/include/opencv2 -L/usr/local/lib/
LDFLAGS := -g
#LDLIBS := -lopencv_core -lopencv_dnn -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lopencv_objdetect -lopencv_video -lopencv_videoio -Wl,-rpath=$(CV_LIB_PATH)
LDLIBS := -lopencv_core -lopencv_dnn -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lopencv_objdetect -lopencv_video -lopencv_videoio

SRCS := $(shell find . -name "*.cpp")
OBJS = $(subst .cpp,.o,$(SRCS))

all: $(appname)

$(appname): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(appname) $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CXXFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(appname) $(OBJS)

dist-clean: clean
	$(RM) *~ .depend

include .depend
