# ================================
#    Dev + Gaming + Tools - RamiroMoralesdev
#     Instalador para Windows
# ================================

function Safe-Run {
    param([string]$cmd)
    Write-Host "➡️ Ejecutando: $cmd"
    try {
        Invoke-Expression $cmd
        Write-Host "   ✔️ OK"
    } catch {
        Write-Host "   ⚠️ Falló, continuando..."
    }
    Write-Host ""
}

# ================================
#   CHEQUEO DE INSTALACIÓN
# ================================

function Is-Installed {
    param([string]$id)
    winget list --id $id | Out-Null
    return ($LASTEXITCODE -eq 0)
}

function Install-App {
    param(
        [string]$Name,
        [string]$Id,
        [bool]$Silent = $true
    )

    if (Is-Installed $Id) {
        Write-Host "✔ $Name ya está instalado"
    } else {
        Write-Host "Instalando $Name..."
        if ($Silent) {
            Safe-Run "winget install -e --silent $Id"
        } else {
            Safe-Run "winget install -e $Id"
        }
    }
}

# ================================
#   FUNCIONES DE INSTALACIÓN
# ================================

function Install-Basics {
    Install-App "Git" "Git.Git"
    Install-App "Python" "Python.Python.3"
    Install-App "Curl" "Curl.Curl"
}

function Install-Chrome { Install-App "Chrome" "Google.Chrome" }
function Install-VSCode { Install-App "VSCode" "Microsoft.VisualStudioCode" }
function Install-Warp { Install-App "Warp" "Warp.Warp" }
function Install-DBeaver { Install-App "DBeaver" "DBeaver.DBeaverCE" }
function Install-Notion { Install-App "Notion" "Notion.Notion" }
function Install-GitHubCLI { Install-App "GitHub CLI" "GitHub.cli" }
function Install-Steam { Install-App "Steam" "Valve.Steam" }
function Install-Imou { Install-App "Imou Life" "Imou.ImouLife" }
function Install-Spotify { Install-App "Spotify" "Spotify.Spotify" }
function Install-EpicGames { Install-App "Epic Games" "EpicGames.EpicGamesLauncher" }
function Install-VLC { Install-App "VLC" "VideoLAN.VLC" }
function Install-WinRAR { Install-App "WinRAR" "RARLab.WinRAR" }
function Install-Discord { Install-App "Discord" "Discord.Discord" }
function Install-NotepadPP { Install-App "Notepad++" "Notepad++.Notepad++" }

function Install-Bun {
    if (Get-Command bun -ErrorAction SilentlyContinue) {
        Write-Host "✔ Bun ya está instalado"
    } else {
        Write-Host "Instalando Bun..."
        Safe-Run "powershell -c `"iwr https://bun.sh/install.ps1 -useb | iex`""
    }
}

function Install-DaVinciResolve {
    Install-App "DaVinci Resolve" "BlackmagicDesign.DaVinciResolve" $false
}

function Config-Git {
    Write-Host "🔹 Configurando Git..."
    Safe-Run "git config --global user.name 'RamiroMoralesdev'"
    Safe-Run "git config --global user.email 'rjaviermoralesjm@gmail.com'"
    Safe-Run "git config --list"
}

# ================================
#       INSTALAR TODO
# ================================

function Install-All {
    Write-Host "🚀 Instalando entorno completo..."
    Install-Basics
    Install-Chrome
    Install-VSCode
    Install-Warp
    Install-DBeaver
    Install-Notion
    Install-GitHubCLI
    Install-Bun
    Install-Steam
    Install-Imou
    Install-Spotify
    Install-EpicGames
    Install-VLC
    Install-WinRAR
    Install-Discord
    Install-NotepadPP
    Install-DaVinciResolve
}

# ================================
#       MENÚ DE SELECCIÓN
# ================================

function Menu-Select {
    while ($true) {
        Write-Host ""
        Write-Host "------ Selecciona paquete ------"
        Write-Host "1) Chrome"
        Write-Host "2) VSCode"
        Write-Host "3) GitHub CLI"
        Write-Host "4) Warp"
        Write-Host "5) DBeaver"
        Write-Host "6) Bun"
        Write-Host "7) Steam"
        Write-Host "8) Imou"
        Write-Host "9) Spotify"
        Write-Host "10) Epic Games"
        Write-Host "11) VLC"
        Write-Host "12) WinRAR"
        Write-Host "13) Discord"
        Write-Host "14) Notepad++"
        Write-Host "15) DaVinci Resolve"
        Write-Host "16) Paquetes básicos"
        Write-Host "17) Volver"
        Write-Host -NoNewline "> "
        $sel = Read-Host

        switch ($sel) {
            "1" { Install-Chrome }
            "2" { Install-VSCode }
            "3" { Install-GitHubCLI }
            "4" { Install-Warp }
            "5" { Install-DBeaver }
            "6" { Install-Bun }
            "7" { Install-Steam }
            "8" { Install-Imou }
            "9" { Install-Spotify }
            "10" { Install-EpicGames }
            "11" { Install-VLC }
            "12" { Install-WinRAR }
            "13" { Install-Discord }
            "14" { Install-NotepadPP }
            "15" { Install-DaVinciResolve }
            "16" { Install-Basics }
            "17" { Menu; return }
            default { Write-Host "Opción inválida." }
        }
    }
}

# ================================
#          MENÚ PRINCIPAL
# ================================

function Menu {
    Write-Host "======================================="
    Write-Host "     Dev + Gaming + Tools  - Instalador automatico Windows | RamiroMoralesdev"
    Write-Host "======================================="
    Write-Host "1) Instalar Todo"
    Write-Host "2) Elegir qué instalar"
    Write-Host "3) Configurar Git"
    Write-Host "4) Salir"
    Write-Host -NoNewline "> "

    $option = Read-Host

    switch ($option) {
        "1" { Install-All }
        "2" { Menu-Select }
        "3" { Config-Git }
        "4" { exit }
        default { Write-Host "Opción inválida" }
    }
}

Menu
