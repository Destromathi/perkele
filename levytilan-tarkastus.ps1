#Lataa funktiot käyttöön
. .\funktiot.ps1

try {
	$asema = Get-PSDrive C
	$vapaa = [math]::Round($asema.Free / 1GB, 2)
	Kirjoita-Loki "C: Asemalla vapaata tilaa $vapaa GB"
}
catch {
	Kirjoita-Loki "Virhe levytilan tarkistuksessa: $($_.Exception.Message)"
	Write-Output "Virhe: $($_.Exception.Message)"
}