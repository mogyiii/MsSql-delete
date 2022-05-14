# This is something which can be useful if you run into error message below during SQL Server installation
# The MOF compiler could not connect with the WMI server - Error in UI
# MSINEWINSTANCE requires a new instance that is not installed - Error in SQL installer logs
# View all installed components which name contains SQL
Get-WmiObject -Query "SELECT * FROM win32_product Where Caption like '%SQL%'" | Select Caption, IdentifyingNumber
# Build a list of commands to uninstall all of them
$components_to_delete = Get-WmiObject -Query "SELECT * FROM win32_product Where Caption like '%SQL%'" | Select -ExpandProperty IdentifyingNumber
foreach ($component in $components_to_delete) {
    echo "msiexec /x $component"
}
