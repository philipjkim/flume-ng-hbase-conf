flume-ng-hbase-conf
===================

Configuration files and startup scripts for Flume NG

## Purpose

Configure and run Flume NG on 2 servers so that a log file on a server(alpha) is stored to HBase on the other server(bravo).

## Usage

- Install Flume NG to alpha and bravo, following [Flume 1.x Installation @ Cloudera](https://ccp.cloudera.com/display/CDHDOC/Flume+1.x+Installation).

- Add `$FLUME_HOME` and `$FLUME_CONF_DIR` to `.bashrc` or `.bash_profile` in alpha and bravo.

```bash
export FLUME_HOME=/usr/local/lib/flume-ng
export FLUME_CONF_DIR=$FLUME_HOME/conf
```

- Copy `flume-hbase-src.conf` to `alpha:$FLUME_HOME/conf/`.

- Copy `flume-hbase-dst.conf` to `bravo:$FLUME_HOME/conf/`.

- Edit `$FLUME_HOME/conf/flume-hbase-src.conf` at alpha. You should change values of `src_agent.sources.tail.command` and `src_agent.sinks.avroSink.hostname`. `hostname` should be either the hostname or IP address of bravo.

- Create `flume-ng-test`, the test table to HBase at bravo.

```bash
hbase(main):002:0> create 'flume-ng-test', 'testing'
```

- Copy `start-flume-dst.sh` to bravo and run the script.

- Copy `start-flume-src.sh` to alpha and run the script.

- Append a couple of lines to the log file at alpha.

- If Flume works correctly, you can see rows inserted in `flume-ng-test` table in bravo's HBase.

```bash
base(main):001:0> scan 'flume-ng-test'
ROW                   COLUMN+CELL
default0ce04bbc-9e0f column=testing:pcol, timestamp=1347599041136, value=Wed Se
-4b20-a733-9ad1cea61 p 12 18:08:19 KST 2012
467
default13a15471-1d2e column=testing:pcol, timestamp=1347599041136, value=Wed Se
-4567-9737-c2b968b0d p 12 18:08:18 KST 2012
2d9
```

## See Also

- [Flume 1.x Installation @ Cloudera](https://ccp.cloudera.com/display/CDHDOC/Flume+1.x+Installation)

- [Flume 1.x User Guide @ Cloudera](http://archive.cloudera.com/cdh/3/flume-ng-1.1.0-cdh3u4/FlumeUserGuide.html)
