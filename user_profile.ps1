oh-my-posh init pwsh --config 'D:\OneDrive - MSFT\Documents\Backup_Setting\Powershell_PROFILE\paradox-bidan.omp.json' | Invoke-Expression

Import-Module Terminal-Icons

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineKeyhandler -Key Tab -function Complete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView


Invoke-Expression (& { (zoxide init powershell | Out-String) })


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


# Network Utilities
function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }

# khiểm tra cổng IP 
function Kiemtracong { netstat -ano | findstr "ESTABLISHED" }

# Notepad++
Set-Alias -name 'npp' -value 'C:\Program Files\Notepad++\notepad++.exe'

# Edit profile
function editprofile { start notepad++ $env:USERPROFILE\.config\powershell\user_profile.ps1 }

# Toi Uu PC christitus
function Chris { irm christitus.com/win | iex }
# yt-dlp
function yt {
    param(
        [string]$URL,
        [string]$Destination = "D:\downloads"  # Thư mục mặc định là D:\download
    )

    # Kiểm tra xem yt-dlp.exe có tồn tại không
    if (-not (Test-Path "D:\yt-dlp\yt-dlp.exe")) {
        Write-Host "Lỗi: Không tìm thấy yt-dlp.exe trong thư mục hiện tại." -ForegroundColor Red
        return
    }

    # Thực hiện tải video từ YouTube và lưu vào thư mục được chỉ định
    & "yt-dlp.exe" $URL -o "$Destination\%(title)s.%(ext)s" -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best
}

# function wheseis
function wheseis ($command) {
	Get-Command -name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

