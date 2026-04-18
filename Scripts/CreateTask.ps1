$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' `
    -Argument '-NoProfile -WindowStyle Hidden -File "C:\Scripts\Logger.ps1"'

# Триггер: запуск сейчас и повторение каждую 1 минуту
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)

# Настройки (разрешить запуск при питании от батареи и т.д.)
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

# Регистрация задачи под системой (чтобы работало в фоне)
Register-ScheduledTask -TaskName "UserActivityLogger" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -User "SYSTEM" `
    -Force