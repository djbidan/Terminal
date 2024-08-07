
oh-my-posh init pwsh --config 'D:\OneDrive - MSFT\Documents\Backup_Setting\Powershell_PROFILE\paradox-bidan.omp.json' | Invoke-Expression

#Terminal Icons
Import-Module Terminal-Icons

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView


Invoke-Expression (& { (zoxide init powershell | Out-String) })

# _______PSFzf__________
	# replace 'Ctrl+t' and 'Ctrl+h' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+h'
	# example command - use $Location with a different command:
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
	# pass your override to PSFzf:
Set-PsFzfOption -AltCCommand $commandOverride
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PsFzfOption -TabExpansion
Set-PsFzfOption -EnableAlias*

# Enhanced PowerShell Experience


function nf { param($name) New-Item -ItemType "file" -Path . -Name $name }

#Tạo thư mục Taotm

function Taotm {
    param (
        [string]$Path,
        [string]$Name
    )
    
    New-Item -Path $Path -Name $Name -ItemType Directory
}


# Enhanced Listing
function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

Set-Alias -name 'ld' -value 'C:\Users\Bidanpc\scoop\shims\lsd.exe'

# Network Utilities
function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }

# khiểm tra cổng IP 
function Kiemtracong { netstat -ano | findstr "ESTABLISHED" }

# Notepad++
Set-Alias -name 'npp' -value 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias -name 'chrome' -value 'C:\Program Files\Google\Chrome\Application\chrome.exe'
# Edit profile
function editprofile { start notepad++ $env:USERPROFILE\.config\powershell\user_profile.ps1 }

# Toi Uu PC christitus
function Chris { irm christitus.com/win | iex }
# yt-dlp
function tai {
    param(
        [string]$URL,
        [string]$Destination = "D:\Downloads\ytdlp"  # Thư mục mặc định là D:\download
    )
    # Thực hiện tải video từ YouTube và lưu vào thư mục được chỉ định
    & "yt-dlp.exe" $URL -o "$Destination\$(Get-Date -Format 'yyyy-MM-dd HH-mm').%(ext)s" -f 'bestvideo[ext=mp4][height>=720][height<=2160]+bestaudio[ext=m4a]/best[ext=mp4]/best'
}

function taids($filePath) {
    $urls = Get-Content $filePath
    $counter = 1

    foreach ($url in $urls) {
        # Lấy thông tin JSON của video
        $jsonInfo = yt-dlp -j $url
        $videoInfo = $jsonInfo | ConvertFrom-Json

        # Lấy các thông tin cần thiết
        $title = $videoInfo.title
        $uploadDate = $videoInfo.upload_date
        $formattedFilename = "${uploadDate}_${counter}.%(ext)s"

        # Tải về video với chất lượng yêu cầu
        yt-dlp -f 'bestvideo[ext=mp4][height>=720][height<=2160]+bestaudio[ext=m4a]/best[ext=mp4]/best' $url -o "D:\Downloads\ytdlp\$formattedFilename"

        $counter++
    }
}

function taidsfull($filePath) {
    $urls = Get-Content $filePath
    $counter = 1

    foreach ($url in $urls) {
        # Lấy thông tin JSON của video
        $jsonInfo = yt-dlp -j $url
        $videoInfo = $jsonInfo | ConvertFrom-Json

        # Lấy các thông tin cần thiết
        $title = $videoInfo.title
        $uploadDate = $videoInfo.upload_date
        $formattedFilename = "${uploadDate}_${counter}.%(ext)s"

        # Tải về video với chất lượng cao nhất
        yt-dlp -f 'bestvideo+bestaudio/best' $url -o "D:\Downloads\ytdlp\$formattedFilename"

        $counter++
    }
}


# function wheseis
function wheseis ($command) {
	Get-Command -name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

