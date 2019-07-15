---


---

<h1 id="introduction">Introduction</h1>
<p>This repository contains three java applications in three sub packages under the root package: Java Grep, JDBC Exercise app, and Twitter CLI app. Following is the detailed de</p>
<h1 id="twitter-cli">Twitter CLI</h1>
<h2 id="introduction-1">Introduction</h2>
<p>Twitter CLI is a command line Java application to create, read, and delete posts on Twitter. It perform POST and GET requests on Twitter API endpoints to perform the create, read, and delete operations.</p>
<h3 id="setup">Setup</h3>
<p>Create an application on Twitter’s Developer account to get access keys and tokens to be used to run this application: Customer key, key secret, access token, and access token secret.  These tokens are necessary to communicate with Twitter REST API.</p>
<p>Set these credentials in the system environment variables to be used by the application.</p>
<h2 id="usage">Usage</h2>
<p>Twitter CLI uses GET, POST, AND DELETE arguments to retrieve tweets based on their ids, post tweets, and delete tweet based on their id.</p>
<p>GET arguments are passed on command line to retrieve tweet based on their id.<br>
<code>GET "1148659969992089602"</code></p>
<p>POST arguments are passed on command line to post a tweet on the timeline passing arguments as status and the coordinates to provide spatial information.<br>
<code>POST "testing a tweet" "-10:10</code></p>
<p>DELETE is used in arguments to delete tweets based on their id.<br>
<code>DELETE "1148659969992089602"</code></p>
<h2 id="design-and-implementation">Design and Implementation</h2>
<h3 id="components">Components</h3>
<ul>
<li><strong><strong>Twitter CLI</strong>:</strong> This module intializes the components and run the Twitter CLI runner.</li>
<li><strong>Twitter CLI Runner:</strong> This directs the program flow based on the arguments passed by the user.</li>
<li><strong>Twitter Service:</strong> It includes the business logic that validates the arguments and send it to appropriate methods to the DAO layer.</li>
<li><strong>Twitter DAO:</strong> This module creates the request to be sent in order to perform GET, POST, DELETE operations.</li>
<li><strong>Http Helper:</strong> This module is used to perform http methods to perform operations at Twitter REST API endpoint.</li>
</ul>
<p><img src="https://lh3.googleusercontent.com/otiV-pm-GyeP9z_qC9aBGRxHinCr-e8ypy8RA-h37c-B0xYjKojfnJ4D5oCIzXBvS5ur3-C5odyr" alt="enter image description here"></p>
<h3 id="spring-configuration">Spring Configuration</h3>
<p>Dependency management has also been implemented using Spring framework through Spring Bean approach, Spring annotation approach, and SpringBoot approach.</p>
<h3 id="workflow">Workflow</h3>
<p>On passing the arguments to the java application, Twitter CLI intializes the components and start the runner. Twitter CLI runner will call the appropriate methods in Twitter service based on arguments. The corresponding method in Twitter service may validate the tweet text and coordinates in case of posting the tweet and form the tweet object to send to Twitter DAO or send the tweet id to get or delete the tweets. Also, it may use the recieved response on performing the methods.  Twitter DAO methods uses the objects sent by Twitter service to generate url or use the id to call methods in https helper module. It also parses the response recieved from http helper to send it back to Twitter service. Http helper uses the request url created by Twitter DAO to send the requests to Twitter API.</p>
<h3 id="testing">Testing</h3>
<p>Unit testing is done using Mockito framework on Twitter service module in isolation. For integration testing, JUnit is used to test the TwitterRestDAO module in integration to the underlying dependency of http helper module.</p>
<h3 id="libraries">Libraries</h3>
<ul>
<li>OAuth-signpost Library: OAuth client library for authentication</li>
<li>Jackson: Map java objects to json and vice versa</li>
<li>JUnit: Integration Testing</li>
<li>Mockito: Unit Testing</li>
<li>Spring framework: Creating IOC Container to configure class dependencies</li>
</ul>
<h2 id="enhancements">Enhancements</h2>
<ul>
<li>Partial testing is done for this. Thorough integration testing should be done and a thorough system testing for the whole application.</li>
<li>There are multitude of methods that can be implemented using Twitter API’s end points that can be used to provide additional functionalities to user such as posting media etc.</li>
</ul>
<h1 id="jdbc-exercise-app">JDBC Exercise App</h1>
<h2 id="introduction-2">Introduction</h2>
<p>JDBC exercise application follows the DAO pattern using the JDBC to perform CRUD operations on the database in the PostgreSQL.</p>
<h2 id="design-and-implementation-1">Design and Implementation</h2>
<h3 id="components-1">Components</h3>
<p><img src="https://lh3.googleusercontent.com/No5JmzkhfYszWtL40INs-0wlaXYQpxPF-c4fbaJnfPkqBm3SAfFF5iiO9tVels1G1qtLOcqLkTLa" alt="enter image description here"></p>
<ul>
<li><strong>JDBC Executer:</strong> This is the main running point of the program to intialize the components. It passes the parameters to intiate the connection with database. It also issues the queries to DAO layer methods to perform operations on database.</li>
<li><strong>DAO Layer:</strong> This formulates the query in proper format to be issues to database in PostgreSQL and parses the response.</li>
<li><strong>Database Connection Manager:</strong> It uses JDBC driver to connect to PostgreSQL database</li>
<li><strong>PostgreSQL database:</strong> Database in stored in PostgreSQL where operations can be performed through database connection manager.</li>
</ul>
<h2 id="enhancements-1">Enhancements</h2>
<ul>
<li>Thorough testing can be done to check the robustness of the application</li>
</ul>
<h1 id="java-grep">Java Grep</h1>
<h2 id="introduction-3">Introduction</h2>
<p>Java Grep is an application that scans the files in a directory and sub directories under the given directory to search for a pattern and print the matched lines in files into an output file.</p>
<h2 id="usage-1">Usage</h2>
<p>The application takes the three arguments: pattern to be matched, rootpath of directory, and output file. It takes the pattern to be matched and scans the files in the given directory and sub directories. It performs the matching of pattern with the text in files and then writes the matched lines to the output file.<br>
<code>regex rootpath outputFile</code></p>
<h2 id="design-and-implementation-2">Design and Implementation</h2>
<p>Pseudo code:</p>
<ol>
<li>Scan the files in directory and subdirectories to obtain list of files.</li>
<li>For all lines present in a file, match the pattern.</li>
<li>If pattern is matched, output the matched line to output file.</li>
</ol>
<h2 id="enhancements-2">Enhancements</h2>
<ul>
<li>Testing could be done in order to check the robustness of the application in various cases.</li>
</ul>

