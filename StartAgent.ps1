# You just need to fill in those 4 variables for the script to work

$JenkinsURI = "http://jenkins:8080"
$NodeName = ""
$Secret = ""
$WorkDir = "C:\Jenkins"

# -----------------

$FileName = "agent.jar"
$AgentURI = "/jnlpJars/$FileName"
$FullUri = $JenkinsURI + $AgentURI
$DestinationPath = "$PSScriptRoot\$FileName"

Write-Host "Source file : $FullUri"
Write-Host "Destination file : $DestinationPath"

Invoke-WebRequest -Uri $FullUri -OutFile $DestinationPath

Invoke-Expression "java -jar agent.jar -jnlpUrl $JenkinsURI/computer/$NodeName/slave-agent.jnlp -secret $Secret -workDir `"$WorkDir`""