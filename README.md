# Cài Đặt 

- Windows Terminal

[Microsoft store](https://apps.microsoft.com/detail/9n0dx20hk701?hl=vi-vn&gl=VN "Microsoft store")

- Powershell 7

`winget install --id Microsoft.Powershell --source winget`

`winget install --id Microsoft.Powershell.Preview --source winget`

[Microsoft Store](https://apps.microsoft.com/detail/9mz1snwt0n5d?hl=vi-vn&gl=VN "Microsoft Store")

- Cài đặt Git 

[Git download](https://git-scm.com/download/win "Git download")


- Cài đặt Scope 

`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex`

Hoặc

`iex "& {$(irm get.scoop.sh)} -RunAsAdmin"`

- Cài đặt Oh My Posh

`scoop install oh-my-posh`

- Cài đặt icon trong Terminal:

`Install-Module -Name Terminal-Icons -Scope CurrentUser -Force`

- Cài linh tinh 

`Install-Module PSReadLine -Force`

`scoop install lsd`

` winget install -e --id ajeetdsouza.zoxide`

`scoop install btop`

`winget install fzf`

`Install-Module -Name PSFzf`

`Install-Module PSEverything`


