<h2 id="introduction">Introduction</h2>
<p>Linux Cluster Monitoring Agent has been implemented with primary goal of assisting infrastructure managers to keep track of hardware specifications and resource usages (e.g. CPU/memory) of nodes in the cluster. It will also assist them in understanding cluster usage and plan for cluster growth. In this application, data persistance is also desired.</p>
<h2 id="architecture-and-design">Architecture and Design</h2>
<p><img src="https://lh3.googleusercontent.com/DZYFcKv1iwS5dS9f0aOuTRKbL2s9VX23a5AuLr4_GmQwpN2GnLQNXMPojiCuprDABzMDNnKAckS1" alt="enter image description here"><br>
There could be multiple nodes in the cluster. Bash agents are the programs installed on every node of the cluster These are designed to support gathering host information and host usage from these nodes and inserting that data into the database. Database will have two schema designed for data persistance for the host information and resources usage.</p>
<h3 id="database-schemas">Database Schemas</h3>
<p>Init.sql is run on every node to create a database with two tables:</p>
<ol>
<li><strong>host_info:</strong> This table persist hardware specifications of the host. It has cpu number, cpu architecture, cpu model, cpu mhz, L2 cache, and current timestamp as the attributes in the table.</li>
<li><strong>host_usage:</strong> This table basically persist CPU and memory usage data of the host. The scheduler runs every minute to insert the data usage data in this table. This table has timestamp, memory free, cpu_idel, cpu_kernel, disk_io, disk_available as the attributes of the table.</li>
</ol>
<h3 id="bash-scripts">Bash Scripts</h3>
<p>There are two bash scripts corresponding to the tables in database in order to collect and persist the data into the table in the database.</p>
<ol>
<li><strong>host_info script:</strong> This script collects the hardware information of the host and persists data into the table. It parses the data and setup variables. It also constructs and executes the sql statements to insert data into the host_info table and saves the generated host id to local file.</li>
<li><strong>host_usage script:</strong> This script collects CPU and memory data after being triggered periodically and persists that data into the host_usage table. Similar to host_info script, it parses the data, constucts and executes the sql statements in order to insert the data into the host_usage table.</li>
</ol>
<h2 id="usage">Usage</h2>
<ol>
<li>Init.sql is executed to create the database and two tables for host information and host usage.</li>
<li>Host_info.sh is executed only once to gather the information of host and store the information into the host_info table.</li>
<li>Host_usage.sh is executed periodically using the scheduler in order to collect the current host usage and the inserted into the database.</li>
<li>To run host_usage periodically after every minute, <code>crontab</code> job is created that triggers the host_info.sh script every minute.</li>
</ol>
<pre><code>#edit the crontab job
crontab -e
***** bash
/home/centos/dev/jrvs/bootcamp/linux/sql/host_agent/scripts/host_usage.sh localhost 5432 host_agent postgres password &gt;tmp/host_usage.log

#list crontab jobs
crontab -ls
</code></pre>
<h2 id="improvements">Improvements</h2>
<p>There are several improvements that could be made:</p>
<ul>
<li>Triggers could be implemented to warn users of certain important information as very less memory, etc.</li>
<li>System Updates should be handled.</li>
<li>More information of host could be useful in analyzing the host_usage in comparison to host_info.</li>
</ul>

