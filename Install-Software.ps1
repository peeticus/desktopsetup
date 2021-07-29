function Assert-AdminRights {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
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
#WinEth for ethereum mining #not available 7-2021
#fractalmapper #not available 7-2021