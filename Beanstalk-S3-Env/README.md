<strong><h1>Provisioning and Deploying Elastic Beanstalk Environment using Terraform</strong></h1>

<h2>Relevant files:</h2>
<ul>
  <li>connections.tf - Initiates provider parameters</li>
  <li>resource.tf - S3 bucket creation and object uploads</li>
  <li>servers.tf - Elastic Beanstalk environment and application server</li>
  <li>variables.tf - Parameters used in .tf files</li>
  <li>index.html - Static HTML home webpage</li>
  <li>error.html - Static HTML error webpage</li>
  <li>run.sh - Bash script to automate Terraform commands - "Plan" and "Apply"</li>
  <li>trash.sh - Bash script to automate Terraform command - "Destroy"</li>
</ul>
