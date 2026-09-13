$dir = "C:\Users\Tito\Desktop\penjadwalan-uh-kimia"
$index = [System.IO.File]::ReadAllText("$dir\template_index.html", [System.Text.Encoding]::UTF8)
$styles = [System.IO.File]::ReadAllText("$dir\Styles.html", [System.Text.Encoding]::UTF8)
$scripts = [System.IO.File]::ReadAllText("$dir\Scripts.html", [System.Text.Encoding]::UTF8)

$bundled = $index.Replace("<?!= include('Styles'); ?>", $styles).Replace("<?!= include('Scripts'); ?>", $scripts)

# Tulis index.html (Halaman Utama untuk GitHub Pages)
[System.IO.File]::WriteAllText("$dir\index.html", $bundled, [System.Text.Encoding]::UTF8)

# Tulis index_preview.html (Untuk double-click preview offline)
[System.IO.File]::WriteAllText("$dir\index_preview.html", $bundled, [System.Text.Encoding]::UTF8)

Write-Output "Berhasil mengompilasi index.html (GitHub Pages) dan index_preview.html!"
