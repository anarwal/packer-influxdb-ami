# InfluxDB AMI:

This repo uses *CentOS 7* base Amazon Machine Images (AMIs) and packer to produce AMI after installing *InfluxDB*, and adding its configuration file to the image. 

# InfluxDB Config:

Under `config` folder, you can find `influxdb.conf` file which we be updating following values in default configuration of InfluxDB:

* Metastore settings
    - [meta-dir] : "/var/lib/influxdb/meta"
* Data settings
    - [data-dir] : "/var/lib/influxdb/data"
    - [wal-dir] : "/var/lib/influxdb/wal"
* In-memory-index-settings
    - [max-values-per-tag] : "999999"
* Tsi-index-settings
    - [series-id-set-cache-size] : "100"

For more information please check
- https://docs.influxdata.com/influxdb/v1.7/administration/config
- https://github.com/influxdata/influxdb/blob/1.7/etc/config.sample.toml