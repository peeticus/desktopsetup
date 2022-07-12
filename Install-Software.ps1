function Assert-AdminRights {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Add-Alias
    ([string]$Name, [string]$Value)
 {
    $profileFilePath = Join-Path -Path $PsHome -ChildPath profile.ps1
    $profileFileExists = Test-Path -Path $profileFilePath -PathType Leaf
    if (!($profileFileExits) -or !(Select-String -Path $profileFilePath -Pattern "kubectl" -ErrorAction Ignore))
    {
        $profileFileContents = Get-Content -Path $profileFilePath -ErrorAction Ignore
        $profileFileContents += "`r`nSet-Alias -Name $Name -Value $Value -Force"
        Set-Content -Path $profileFilePath -Value $profileFileContents
    }
    Set-Alias -Name k -Value kubectl -Force
}

if (!(Assert-AdminRights)) {
    Write-Error "Admin rights are necessary to run this script. Please open a shell as a local administrator and run this script within."
    exit 1
}

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

choco install conemu
choco install steam-client
choco install microsoft-office-deployment --params="'/64bit'"
choco install googlechrome
choco install firefox --params "/NoDesktopShortcut"
choco install dotnet-5.0-sdk
choco install visualstudio2019community --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
choco install visualstudio2022community  --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
choco install vscode --params "/NoDesktopIcon"
choco install notepadplusplus
choco install sql-server-management-studio
choco install wsl2
choco install docker-desktop
choco install git
choco install adobereader
choco install google-backup-and-sync
choco install discord
choco install fiddler
choco install gimp
choco install inkscape
choco install keepass
choco install microsoftazurestorageexplorer
choco install nodejs
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
npm install -g @angular/cli
choco install insomnia-rest-api-client
choco install skype
Stop-Process -Name "Skype" -Force
#Upwork #not available 7-2021
choco install wiztree
#Civ4 & BTS #not available 7-2021
choco install 7zip.install --pre 
choco install curl
choco install azure-cli
choco install poshgit
choco install vscode-icons
choco install filezilla
choco install kubernetes-helm
choco install microsoft-windows-terminal --pre
Add-Alias -Name "k" -Value "kubectl" 

Invoke-WebRequest -useb https://raw.githubusercontent.com/dapr/cli/master/install/install.ps1 | Invoke-Expression #Dapr
dapr init
choco install minikube
minikube start
dapr init -k


#WinEth for ethereum mining #not available 7-2021
#fractalmapper #not available 7-2021