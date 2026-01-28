param (
    [string]$Kone = "localhost"
)

. .\funktiot.ps1   # LOKI kirjoitetaan TÄLLÄ koneella

try {
    $Tulos = Invoke-Command -ComputerName $Kone -ScriptBlock {

        $KoneNimi = hostname
        $Aika = Get-Date

        # Palautetaan data, EI kirjoiteta lokia täällä 'tämä tuotti päänvaivaa'
        [PSCustomObject]@{
            Kone = $KoneNimi
            Aika = $Aika
        }
    }

    # Kirjoitetaan loki paikallisesti
    Kirjoita-Loki "Kone: $($Tulos.Kone) | Aika: $($Tulos.Aika)"
}
catch {
    Kirjoita-Loki "Virhe etähallinnassa ($Kone): $($_.Exception.Message)"
    Write-Output "Virhe: $($_.Exception.Message)"
}


