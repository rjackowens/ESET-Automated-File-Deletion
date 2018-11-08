ESET Automated File Deletion:
This script allows users to enter an unformatted ESET Security Alert email which will automatically be parsed and deleted from the applicable UNC network path.

Prerequisites:
This tool requires no prerequisites, however, PowerShell 5.1 or above is reccomended.

Getting Started:
This script was designed to be run within the PowerShell ISE. Simply run the script and paste the unformatted ESET Security Alert email text and press Enter. The script will display if the file was deleted successfully.   

Known Issues:
The remove-file and test-path cmdlets do not natively support UTF-8 encoding. As a result, some UTF-8 unicode special characters will not be properly parsed and/or deleted. If a file path is not found, ensure that the path does not include UTF-8 special characters.
NOTE: A possible workaround for this issue is to change the default paramter encoding to support UTF-8 via $PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'. However, at the time of this writing, neither affected cmdlet accept an -encoding parameter.

Authors:
Jack Owens - Initial work -

License:
This project is licensed under the MIT License.