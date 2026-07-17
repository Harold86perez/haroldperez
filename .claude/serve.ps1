$root = "C:\Users\User\Documents\proyectos-web\haroldperez"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8791/")
$listener.Start()
Write-Host "Serving $root on http://localhost:8791/"
$mime = @{ ".html"="text/html"; ".css"="text/css"; ".js"="application/javascript"; ".svg"="image/svg+xml"; ".png"="image/png"; ".jpg"="image/jpeg"; ".jpeg"="image/jpeg"; ".xml"="application/xml"; ".txt"="text/plain"; ".json"="application/json" }
while ($listener.IsListening) {
  $context = $listener.GetContext()
  $req = $context.Request
  $res = $context.Response
  $path = $req.Url.LocalPath
  if ($path -eq "/") { $path = "/index.html" }
  $fsPath = Join-Path $root ($path.TrimStart("/") -replace "/", "\")
  if (Test-Path $fsPath -PathType Container) { $fsPath = Join-Path $fsPath "index.html" }
  if (Test-Path $fsPath -PathType Leaf) {
    $ext = [System.IO.Path]::GetExtension($fsPath)
    $ct = $mime[$ext]
    if (-not $ct) { $ct = "application/octet-stream" }
    $bytes = [System.IO.File]::ReadAllBytes($fsPath)
    $res.SendChunked = $false
    $res.KeepAlive = $false
    $res.ContentType = $ct
    if ($req.HttpMethod -ne "HEAD") {
      $res.ContentLength64 = [int64]$bytes.Length
      $res.OutputStream.Write($bytes, 0, $bytes.Length)
    }
  } else {
    $res.StatusCode = 404
    $res.SendChunked = $false
    $msg = [System.Text.Encoding]::UTF8.GetBytes("Not found")
    $res.ContentLength64 = $msg.Length
    $res.OutputStream.Write($msg, 0, $msg.Length)
  }
  $res.OutputStream.Close()
}
