$data = Import-Csv -Path ".\cup_drivers.csv"

$data | Format-Table

if (-Not (Test-Path -Path ".\stockcars2 camaro2019" -PathType Container)) {
    New-Item -Name "stockcars2 camaro2019" -ItemType Directory
}
if (-Not (Test-Path -Path ".\stockcars2 mustang2019" -PathType Container)) {
    New-Item -Name "stockcars2 mustang2019" -ItemType Directory
}
if (-Not (Test-Path -Path ".\stockcars2 supra2019" -PathType Container)) {
    New-Item -Name "stockcars2 supra2019" -ItemType Directory
}

foreach ($row in $data) {
    Copy-Item -Path ".\camaro2019.tga" -Destination ".\stockcars2 camaro2019\car_decal_$($row.CustomerID).tga"
    Copy-Item -Path ".\mustang2019.tga" -Destination ".\stockcars2 mustang2019\car_decal_$($row.CustomerID).tga"
    Copy-Item -Path ".\supra2019.tga" -Destination ".\stockcars2 supra2019\car_decal_$($row.CustomerID).tga"
}

if (Test-Path -Path ".\paint.zip" -PathType Leaf) {
    Remove-Item -Path ".\paint.zip"
}

Compress-Archive -Path ".\stockcars2*" -DestinationPath ".\paint.zip"