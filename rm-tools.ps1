# ================================
#    Dev + Gaming Tools - RamiroMoralesdev
#     Instalador para Windows
# ================================

# Ejecutar comando sin romper todo
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
#   FUNCIONES DE INSTALACIÓN
# ================================

function Install-Basics {
    Write-Host "Instalando paquetes básicos..."
    Safe-Run "winget install -e --silent Git.Git"
    Safe-Run "winget install -e --silent Python.Python.3"
    Safe-Run "winget install -e --silent Curl.Curl"
}

function Install-Chrome {
    Write-Host "Instalando Chrome..."
    Safe-Run "winget install -e --silent Google.Chrome"
}

function Install-VSCode {
    Write-Host "Instalando VSCode..."
    Safe-Run "winget install -e --silent Microsoft.VisualStudioCode"
}

function Install-Warp {
    Write-Host "Instalando Warp..."
    Safe-Run "winget install -e --silent Warp.Warp"
}

function Install-DBeaver {
    Write-Host "Instalando DBeaver..."
    Safe-Run "winget install -e --silent DBeaver.DBeaverCE"
}

function Install-Notion {
    Write-Host "Instalando Notion..."
    Safe-Run "winget install -e --silent Notion.Notion"
}

function Install-GitHubCLI {
    Write-Host "Instalando GitHub CLI..."
    Safe-Run "winget install -e --silent GitHub.cli"
}

function Config-Git {
    Write-Host "🔹 Configurando Git..."
    Safe-Run "git config --global user.name 'RamiroMoralesdev'"
    Safe-Run "git config --global user.email 'rjaviermoralesjm@gmail.com'"
    Write-Host "✔ Git configurado."
    Safe-Run "git config --list"
}

function Install-Bun {
    Write-Host "Instalando Bun..."
    Safe-Run "powershell -c `"iwr https://bun.sh/install.ps1 -useb | iex`""
}

function Install-Steam {
    Write-Host "Instalando Steam..."
    Safe-Run "winget install -e --silent Valve.Steam"
}

function Install-Imou {
    Write-Host "Instalando Imou Life..."
    Safe-Run "winget install -e --silent Imou.ImouLife"
}

function Install-Spotify {
    Write-Host "Instalando Spotify..."
    Safe-Run "winget install -e --silent Spotify.Spotify"
}

function Install-EpicGames {
    Write-Host "Instalando Epic Games..."
    Safe-Run "winget install -e --silent EpicGames.EpicGamesLauncher"
}

function Install-VLC {
    Write-Host "Instalando VLC..."
    Safe-Run "winget install -e --silent VideoLAN.VLC"
}

function Install-WinRAR {
    Write-Host "Instalando WinRAR..."
    Safe-Run "winget install -e --silent RARLab.WinRAR"
}

function Install-Discord {
    Write-Host "Instalando Discord..."
    Safe-Run "winget install -e --silent Discord.Discord"
}

function Install-NotepadPP {
    Write-Host "Instalando Notepad++..."
    Safe-Run "winget install -e --silent Notepad++.Notepad++"
}

# ================================
#       INSTALAR TODO
# ================================

function Install-All {
    Write-Host "🚀 Instalando TODO el entorno de Ramiro..."
    
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
        Write-Host "15) Paquetes básicos"
        Write-Host "16) Volver"
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
            "15" { Install-Basics }
            "16" { Menu; return }
            default { Write-Host "Opción inválida." }
        }
    }
}

# ================================
#          MENÚ PRINCIPAL
# ================================

function Menu {
    Write-Host "======================================="
    Write-Host "     Dev + Gaming Tools - RamiroMoralesdev"
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
