param (
	[Parameter(Mandatory = $true)]
	[string]$kansio
)

. .\funktiot.ps1


try {
		Kirjoita-Loki "$Uuden kansion luonti aloitettu."
Luo-kansio -nimi $kansio
	Kirjoita-Loki "Uusi kansio $kansio luotu."
} catch {
    Kirjoita-Loki "Virhe kansion luonnissa: $($_.Exception.Message)"
    Write-Output "Virhe: $($_.Exception.Message)"
    exit 1
}