param (
    [Parameter(Mandatory = $true)]
    [string]$Lahde,
    [string]$Kohde = "Varmuuskopio"
)
 
. .\funktiot.ps1
 
# Lisätään päivämäärä kohdekansion nimeen
$paiva = Get-Date -Format "yyyyMMdd"
$Kohde = "$Lahde-$paiva"
 
function Luo-Kansio {
    param ([string]$Nimi)
 
    if (-not (Test-Path -Path $Nimi)) {
        New-Item -ItemType Directory -Path $Nimi | Out-Null
    }
}
 
function Kopio-Tiedostot {
    param (
        [string]$Lahto,
        [string]$Maali
    )
    Copy-Item "$Lahto\*" $Maali -Recurse -Force -ErrorAction Stop
}
 
# -------------------------
# Pääohjelma
# -------------------------
try {
    Kirjoita-Loki "Varmuuskopiointi aloitettu"
 
    if (-not (Test-Path -Path $Lahde)) {
        throw "Lähdekansiota ei löydy: $Lahde"
    }
 
    Luo-Kansio -Nimi $Kohde
    Kopio-Tiedostot -Lahto $Lahde -Maali $Kohde
 
    Kirjoita-Loki "Varmuuskopio onnistui: $Lahde -> $Kohde"
    Write-Output "Varmuuskopio on valmis: $Lahde -> $Kohde"
}
catch {
    Kirjoita-Loki "Virhe varmuuskopioinnissa: $($_.Exception.Message)"
    Write-Output "Virhe: $($_.Exception.Message)"
    exit 1
}