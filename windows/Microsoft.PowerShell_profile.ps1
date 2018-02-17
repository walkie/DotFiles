Set-PSReadlineOption -BellStyle None

function prompt {
  $who   = $Env:username
  $where = $Env:computername.toLower()
  $when  = Get-Date -Format "HH:mm:ss"
  $pwd   = $ExecutionContext.SessionState.Path.CurrentLocation
  Write-Host -NoNewline "PS> "
  Write-Host -NoNewline $who -ForegroundColor Blue
  Write-Host -NoNewline "@"
  Write-Host -NoNewline $where -ForegroundColor Blue
  Write-Host -NoNewline " $when " -ForegroundColor Green
  Write-Host $pwd -ForegroundColor Red
  "$('$' * ($nestedPromptLevel + 1)) "
}
