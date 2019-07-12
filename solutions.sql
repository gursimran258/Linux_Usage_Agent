1. SELECT cpu_number,id,total_mem,
rank() OVER (
PARTITION BY cpu_number
ORDER BY total_mem
)
FROM host_info WHERE cpu_number>1
;
