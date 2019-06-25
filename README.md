---


---

<h1 id="introduction">INTRODUCTION</h1>
<p>Linux Cluster Monitoring Agent has been implemented with primary goal of assisting infrastructure Managers to keep track of hardware specifications and resource usages. It will help them in understanding cluster usage and plan for cluster growth.</p>
<h1 id="architecture-and-design">ARCHITECTURE AND DESIGN</h1>
<p>There could be multiple nodes in the cluster. Bash agents are designed to support  gathering data and inserting into the database. Database will have two schema designed to gather host information and usage of resources on the host.</p>
<h2 id="host-information">Host information</h2>
<p>This schema is designed to gather host id, name, processor and related information of host.</p>
<h2 id="host-usage">Host usage</h2>
<p>This schema is designed to gather the usage of recources on the database.</p>
<h2 id="usage">USAGE</h2>
<p>Database and tables are initiated using the init.sql file.<br>
Bash_info.sh provides the information of host by inserting it into the host_info table.<br>
Bash_usage.sh is set to run every minute inserting the information of usage of resources into the host_usage table.<br>
Crontab is used to run this job every minute.</p>
<h2 id="improvements">IMPROVEMENTS</h2>
<p>There are several improvements that could be done.<br>
Triggers could be implemented to warn users of certain important  information as very less memory, etc.<br>
System Updates should be handled.<br>
More information of host could be useful in analyzing the host_usage in comparison to host_info.</p>

