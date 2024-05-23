

# Script to install Ubuntu on WSL using PowerShell

# Function to check if a feature is enabled
function Is-FeatureEnabled {
    param (
        [string]$featureName
    )
    $feature = Get-WindowsOptionalFeature -Online -FeatureName $featureName
    return $feature.State -eq 'Enabled'
}

# Enable WSL feature
if (-not (Is-FeatureEnabled -featureName "Microsoft-Windows-Subsystem-Linux")) {
    Write-Output "Enabling Windows Subsystem for Linux..."
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
} else {
    Write-Output "WSL is already enabled."
}

# Enable Virtual Machine Platform feature
if (-not (Is-FeatureEnabled -featureName "VirtualMachinePlatform")) {
    Write-Output "Enabling Virtual Machine Platform..."
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
} else {
    Write-Output "Virtual Machine Platform is already enabled."
}

# Restart the computer to apply the changes
Write-Output "Restarting the computer to apply changes..."
Restart-Computer -Force

# Set WSL 2 as the default version (this will execute after restart)
Register-ScheduledTask -TaskName "SetWSL2AsDefault" -Trigger (New-ScheduledTaskTrigger -AtStartup) -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command `"wsl --set-default-version 2`"") -RunLevel Highest -Force

# Schedule the installation of Ubuntu (this will execute after restart)
Register-ScheduledTask -TaskName "InstallUbuntu" -Trigger (New-ScheduledTaskTrigger -AtStartup) -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command `"wsl --install -d Ubuntu`"") -RunLevel Highest -Force

# Notify the user to log back in after restart
Write-Output "The computer will now restart. After logging back in, WSL 2 will be set as the default and Ubuntu will be installed automatically."
