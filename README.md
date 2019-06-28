# telegraf-opensips.sh
collects metrics and sends them to influxdb

```
Opensips Metrics
This script collects the following Opensips metrics:
    - active calls
```



# Usage

```
./telegraf-opensips.sh
{"active_calls": 12}   
```

# INSTALL

```
wget 'https://raw.githubusercontent.com/akhilin/telegraf-opensips.sh/master/telegraf-opsnsips.sh' -P /opt/
chmod +x /opt/telegraf-opensips.sh
wget 'https://raw.githubusercontent.com/akhilin/telegraf-opensips.sh/master/opensips.conf' -P /etc/telegraf/telegraf.d
```

# Configuration (telegraf.d/opensips.conf)

```
# Read flattened metrics from one or more commands that output JSON to stdout
[[inputs.exec]]
  # Set interval to 5s
  interval = "5s"

  # the command to run
  command = "/opt/telegraf-opensips.sh"

  # Data format to consume. This can be "json" or "influx" (line-protocol)
  # NOTE json only reads numerical measurements, strings and booleans are ignored.
  data_format = "json"

  # measurement name suffix (for separating different commands)
  name_suffix = "_opensips"
```

# Test Config and reload
```
telegraf -config /etc/telegraf/telegraf.conf -test && systemctl restart telegraf
```
# Permission Fix (https://github.com/influxdata/telegraf/issues/3671)
```
allow telegraf in visudo
```
