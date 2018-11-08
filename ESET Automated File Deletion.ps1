# Prompts User to Enter Unformatted ESET Ticket
$text_input = (Read-Host "Enter ESET Ticket")

# Assigns Infected Computer Name to Variable
$computer_name = ($text_input.Trim("Computer infected: ")).Split([Environment]::NewLine) | Select -First 1

# Returns Error if Computer Name Cannot be Found
if ([string]::IsNullOrEmpty($computer_name)) {
    Write-Host "ERROR. UNABLE TO FIND COMPUTER NAME" -ForegroundColor Red
} else {
# Continue
}

# Assigns Infected File Locate to Variable
$file_path = ($text_input.Trim("infected file: c:\").ToLower()).Split([Environment]::NewLine) | Select -Index 4 

# Formats Infected File Location as UNC Network Path
$unc_file_path = "\\" + $computer_name + "\c$\" + $file_path.ToLower().Replace("infected file: c:\","")

Write-Host " " # Verbose Stdout Line Break as `n is not Practical
Write-Host "Attempting to Locate:" $unc_file_path

# Tests if File Path Exists
if (Test-Path $unc_file_path) {
    Write-Host "`nFile Path Exists. Removing Item...`n" -ForegroundColor Green
}
else {
    Write-Host "`nERROR. FILE PATH NOT FOUND`n" -ForegroundColor Red
}

# Removes Infected File at UNC File Path
Remove-Item $unc_file_path