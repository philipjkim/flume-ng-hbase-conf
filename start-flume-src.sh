#!/bin/sh

$FLUME_HOME/bin/flume-ng agent --conf $FLUME_HOME/conf --conf-file $FLUME_HOME/conf/flume-hbase-src.conf --name src_agent -Dflume.root.logger=DEBUG,console
