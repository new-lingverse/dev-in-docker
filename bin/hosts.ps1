# 获取 WSL IP 地址
$wslIp = bash -c "cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*'"

Write-Output "WSL IP Address: $wslIp"
# 定义要更新的 hostnames
$hostnames = @("redis.local", "mysql.local")

# 读取当前 hosts 文件内容
$hostsPath = "C:\Windows\System32\drivers\etc\hosts"
$hostsContent = Get-Content $hostsPath


# 移除旧的条目
$hostnames | ForEach-Object {
    $hostsContent = $hostsContent -notmatch "\s$_$"
}

# 添加新的条目
$hostnames | ForEach-Object {
    $hostsContent += "$wslIp $_"
}

# 写回 hosts 文件（需要管理员权限）
$hostsContent | Out-File $hostsPath -Encoding UTF8 -Force

Read-Host -Prompt "Press any key to exit..."
