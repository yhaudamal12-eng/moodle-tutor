# Moodle Tutor: first install (and repair). Puts the extension in Documents\moodle-tutor and registers
# the one-click updater. Run: irm https://raw.githubusercontent.com/yhaudamal12-eng/moodle-tutor/main/install.ps1 | iex
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$repo = 'https://raw.githubusercontent.com/yhaudamal12-eng/moodle-tutor/main'
$docs = [Environment]::GetFolderPath('MyDocuments')
$zip = Join-Path ([IO.Path]::GetTempPath()) 'moodle-tutor-install.zip'
Write-Host 'Downloading Moodle Tutor...'
Invoke-WebRequest -Uri "$repo/releases/moodle-tutor-latest.zip" -OutFile $zip -UseBasicParsing
Expand-Archive -Path $zip -DestinationPath $docs -Force
Remove-Item $zip -ErrorAction SilentlyContinue
$ext = Join-Path $docs 'moodle-tutor'
& (Join-Path (Join-Path $ext 'installer') 'register.ps1') -ExtensionDir $ext
Write-Host ''
Write-Host "Installed in: $ext"
Write-Host 'Next: open chrome://extensions, turn on Developer mode, click "Load unpacked" and choose that folder.'
Write-Host 'If it is already loaded there, just click its reload arrow.'
