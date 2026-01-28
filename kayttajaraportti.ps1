. .\funktiot.ps1

try {
	Kirjoita-Loki "Aloitetaan paikallisten äyttäjien raportointi"
	Luo-Kansio -Nimi "Raportit"
	
	$kayttajat = Get-LocalUser | Select Name, Enabled, LastLogon
	
	$polku = "Raportit\PaikallisetKayttajat.csv"
	
	$kayttajat | Export-Csv $polku -NoTypeInformation
	
	Kirjoita-Loki "Raportti on luotu"
}
catch {
	Kirjoita-Loki "Virhe raportoinnissa: $($_.Exception.Message)"
}