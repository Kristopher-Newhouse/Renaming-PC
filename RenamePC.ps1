Add-Type -AssemblyName PresentationCore,PresentationFramework
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$Credential=Get-Credential

Do {
$title = 'Current Name'
$msg   = 'What Computer do you want to rename?'

$ComputerName = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)

$title2 = 'New Name'
$msg2   = 'What do you want to rename the computer?'

$NewName = [Microsoft.VisualBasic.Interaction]::InputBox($msg2, $title2)

$msgBody = "Are you sure you want to rename $ComputerName to $NewName ?"
$msgTitle = "Confirm Rename"
$msgButton = 'YesNoCancel'
$msgImage = 'Question'
$Result = [System.Windows.MessageBox]::Show($msgBody,$msgTitle,$msgButton,$msgImage)


if ($Result -eq 'Yes') {
    Rename-Computer -ComputerName $ComputerName  `
                 -NewName $NewName `
                 -DomainCredential $Credential `
                 -Force `
                 -Restart 
} 
} 
while ($Result -eq "No")

