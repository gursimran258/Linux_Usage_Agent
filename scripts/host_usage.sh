#! /bin/bash

#Setup argumemnts
psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5

#Collect and persist CPU and memory usage data
#tablename=host_usage
#columns

get_timestamp() {
timestamp=$(vmstat -t | awk '{print $18,$19}')
}

get_host_id() {
host_id=$(cat ~/host_id)
}

get_memory_free() {
memory_free=$(vmstat -t | awk '{print $4}' | tail -1)
}

get_cpu_idel() {
cpu_idel=$(vmstat -t | awk '{print $15}' | tail -1)
}

get_cpu_kernel() {
cpu_kernel=$(vmstat -t | awk '{print $14}' | tail -1)
}

get_disk_io() {
disk_io=$(df -BM / | awk '{print $2}' | tail -1 | grep -o -E '[0-9]+')
}

get_disk_available() {
disk_available=$(df -BM / | awk '{print $4}' | tail -1 | grep -o -E '[0-9]+')
}

#Get data
get_timestamp
get_host_id
get_memory_free
get_cpu_idel
get_cpu_kernel
get_disk_io
get_disk_available

#Insert into table
insert_stmt=$(cat <<-END
INSERT INTO host_usage ("timestamp", host_id, memory_free, cpu_idel, cpu_kernel, disk_io, disk_available) VALUES('${timestamp}','${host_id}','${memory_free}','${cpu_idel}', ${cpu_kernel}, '${disk_io}', '${disk_available}');
END
)
echo $insert_stmt

#Step 3: execute insert statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmt"
sleep 1