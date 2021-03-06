$text_input = (Read-Host "Enter ESET Ticket")

$computer_name = ($text_input.Trim("Computer infected: ")).Split([Environment]::NewLine) | Select -First 1

if ([string]::IsNullOrEmpty($computer_name)) {
    Write-Host "Unable to find computer name." -ForegroundColor Red
} 

$file_path = ($text_input.Trim("infected file: c:\").ToLower()).Split([Environment]::NewLine) | Select -Index 4 

# Formats Infected File Location as UNC Network Path
$unc_file_path = "\\" + $computer_name + "\c$\" + $file_path.ToLower().Replace("infected file: c:\","")

Write-Host " " # Verbose Stdout Line Break as `n is not Practical
Write-Host "Attempting to Locate:" $unc_file_path

if (Test-Path $unc_file_path) {
    Write-Host "`nFile Path Exists. Removing Item...`n" -ForegroundColor Green
}
else {
    Write-Host "`Error. File path not found.`n" -ForegroundColor Red
}

Remove-Item $unc_file_path
