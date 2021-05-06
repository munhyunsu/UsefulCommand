### Fully distributed from pseudo-distributed mode

1. vi /etc/netplan/00-installer-config.yaml
```
dhcp4: no
addresses: [192.168.56.50/24]
```

1. vi /etc/hosts
```
192.168.56.50 hadoop-01
...
```

1. vi /etc/hostname

1. vi /etc/profile.d/hadoop.sh
```
export HADOOP_HOME="/home/...."
```

1. vi ./etc/hadoop/core-site.xml
```
fs.defaultFS
```

1. vi ./etc/hadoop/hdfs-site.xml
```
dfs.replication
```

1. vi ./etc/hadoop/yarn-site.xml
```
yarn.resourcemanager.hostname
```

1. vi ./etc/workers
```
hadoop-02
...
```
