# TODO: Override or not
# TODO: Check for ImageMagick executable

Write-Output "ImageMagick Macro : PNG Trimmer v0.1"

$path = Read-Host "Enter target path"
$filepath = $path + "\*"
$files = Get-ChildItem -Path $filepath -Include "*.png"

Write-Output $files.Count

if ($files.Count -gt 0)
{
    $trimfolder = $path + "\trimmed\"
    New-Item -Path $trimfolder -ItemType Directory
}

foreach ($file in $files)
{
    $trimfile = $trimfolder + $file.Name
    magick convert $file.FullName -fuzz 1% -trim +repage $trimfile
}