# Moodle Tutor: removal. First remove the extension in chrome://extensions, then run:
#   irm https://raw.githubusercontent.com/yhaudamal12-eng/moodle-tutor/main/uninstall.ps1 | iex
# Removes the extension's folder (Documents\moodle-tutor) and the updater. Course files that were
# downloaded (Downloads\Moodle) and the tutors in the chats are NOT touched.
$ErrorActionPreference = 'Continue'
$docs = [Environment]::GetFolderPath('MyDocuments')
$ext = Join-Path $docs 'moodle-tutor'
$home2 = if ($env:LOCALAPPDATA) { Join-Path $env:LOCALAPPDATA 'MoodleTutor' } else { '' }
$key = 'HKCU:\Software\Google\Chrome\NativeMessagingHosts\com.moodle_tutor.updater'
if (Test-Path -LiteralPath $ext) { Remove-Item -LiteralPath $ext -Recurse -Force; Write-Host "Removed: $ext" }
if ($home2 -and (Test-Path -LiteralPath $home2)) { Remove-Item -LiteralPath $home2 -Recurse -Force; Write-Host "Removed: $home2" }
if (Test-Path $key -ErrorAction SilentlyContinue) { Remove-Item -Path $key -Force; Write-Host 'Removed the updater registration.' }
Write-Host 'Moodle Tutor was removed. Your downloaded course files (Downloads\Moodle) were kept.'
