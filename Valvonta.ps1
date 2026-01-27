param (
	[Parameter(Mandatory = $true)]
	[string]$Kansio
)

. .\funktiot.ps1

try {
	Kirjoita-Loki "Valvonta alkoi"

	if (-not (Test-Path -Path $Kansio)) {
		throw "Kansiota ei loydy: $Kansio"
	}
	$maara = (Get-ChildItem $Kansio -File).Count
	Kirjoita-Loki "Tiedostoja kansiossa ${Kansio}: $maara"
	Write-Host "Tiedostoja kansiossa ${Kansio}: $maara"
}

catch {
	Kirjoita-Loki "Virhe valvonnassa: $($_.Exception.Message)"
	Write-Output "Virhe: $($_.Exception.Message)"
exit 1
}

