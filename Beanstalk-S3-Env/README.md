<strong><h1>Provisioning and Deploying Elastic Beanstalk Environment using Terraform</strong></h1>

<h2>Relevant files:</h2>
<ul>
  <li>connections.tf - Initiates provider parameters</li>
  <li>resource.tf - S3 bucket creation and object uploads</li>
  <li>servers.tf - Elastic Beanstalk environment and application server</li>
  <li>variables.tf - Parameters used in .tf files</li>
  <li>index.html - Static HTML home webpage</li>
  <li>error.html - Static HTML error webpage</li>
  <li>run.sh - Bash script to automate Terraform commands - "fmt", "plan" and "apply"</li>
  <li>trash.sh - Bash script to automate Terraform command - "Destroy"</li>
</ul>

<h2>Execution Instructions</h2>
<ol>
  <li>Download and extract contents of compressed .zip folder from GitHub into working directory</li>
  <li>In CLI, execute command "terraform init" within working directory</li>
  <li>Update resource.tf file with file source path for both index and error HTML documents, namely parameters "source" and "etag" to reflect working directory where local files are found</li>
  <li>Run "./run.sh" bash script to format, display plan, and apply Terraform infrastructure.
  <li>Enter access and secret keys in CLI when prompted. Note: It may take a few minutes to provision and deploy EB environment</li></li>
  <li>Navigate to AWS Console and view Elastic Beanstalk environment and application, in addition to S3 bucket where HTML docs are stored</li>
  <li>From Elastic Beanstalk Console, navigate to "Application version" and then click on "index.html" to display static webpage</li>
  <li>To destroy application and EB environment, run bash script "./trash.sh" and enter "yes" to proceed destroying Terraform deployment</li>
</ol>

<h2>Implementation Revision - To Do List</h2>
<ul>
  <li>Add AWS networking features to environment</li>
  <li>Add additional security measures including bucket policies and IAM Beanstalk roles to safeguard environment</li>
  <li>Fix hard-coded source file PATH to reflect working directory</li>
  <li>Fix Elastic Beanstalk environment to display the static HTML page from environment URL - nodes currently running node.js</li>
  <li>Create modules within current infrastructure code to ensure reusability</li> 
</ul>
