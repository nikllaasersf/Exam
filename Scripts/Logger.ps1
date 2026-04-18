# Путь к файлу лога
$logPath = "C:\Scripts\log.txt"

# Формируем строку: Дата Время - Пользователь
$logEntry = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $($env:USERNAME)"

# Записываем в файл (добавление в конец)
$logEntry | Out-File -FilePath $logPath -Append -Encoding UTF8