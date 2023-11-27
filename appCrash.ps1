# This PowerShell script retrieves Application Event Logs from a remote computer. 

$LogName = "Application"
$Source = "Application Error"
$NumberOfEvents = 10
$RemoteComputerName = "REMOTECOMPUTER" # Replace This With Your Remote Computer Name
# Retrieve the latest application error events from the remote computer
$Events = Get-WinEvent -LogName $LogName -FilterXPath "*[System[Provider[@Name='$Source']]]" -MaxEvents $NumberOfEvents -ComputerName $RemoteComputerName | Select-Object TimeCreated, LevelDisplayName, ProviderName, Id, Message

# Display the retrieved events
$Events
