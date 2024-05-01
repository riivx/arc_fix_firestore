# Processo a ser monitorado
$processName = "Arc"
$taskExecuted = $false
# Função para executar a tarefa desejada
function ExecuteTask {
    Write-Output "O processo $processName foi fechado."
    Start-Process "C:\\ArcFix.bat"
}

# Monitora o processo em loop
while ($true) {
    # Verifica se o processo está em execução
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    
    # Se o processo não estiver mais em execução, executa a tarefa
    if ($process -eq $null -and -not $taskExecuted) {
        ExecuteTask
		$taskExecuted = $true;
        #break
    }
	elseif ($process -ne $null) {
        $taskExecuted = $false
    }    
    # Aguarda alguns segundos antes de verificar novamente
    Start-Sleep -Seconds 2
}