function downloadCore($url, $core) {
	#Invoke-WebRequest -Uri $url -OutFile $output
	$wc = New-Object net.webclient
	$destination="$emusPath/RetroArch/cores/$core.zip"
	$wc.Downloadfile($url, $destination)

	foreach ($line in $destination) {
		$extn = [IO.Path]::GetExtension($line)
		if ($extn -eq ".zip" ){
			$7z x -o"$emusPath/RetroArch/cores/" -aoa $destination
			Start-Sleep -Seconds 0.5
			Remove-Item $destination
		}
	}
	Write-Host "Done!" -ForegroundColor green -BackgroundColor black
}
