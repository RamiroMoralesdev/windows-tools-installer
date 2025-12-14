Windows tiene un firewall que impide ejecutar scripts en powershell. Para desactivar firewall en la session de la terminal. 
Set-ExecutionPolicy Bypass -Scope Process -Force
.\rm-tools.ps1
