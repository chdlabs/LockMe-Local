# install-python-flask.ps1 avec interface graphique
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Add-Step($step, $desc, $state) {
    $item = New-Object Windows.Forms.ListViewItem($step)
    $item.SubItems.Add($desc)
    $item.SubItems.Add($state)
    $listView.Items.Add($item) | Out-Null
    $form.Refresh()
}

function Update-Progress($val) {
    $progress.Value = $val
    $form.Refresh()
}

$form = New-Object Windows.Forms.Form
$form.Text = "Installation Python + Flask"
$form.Size = New-Object Drawing.Size(600, 350)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.MinimizeBox = $false

$listView = New-Object Windows.Forms.ListView
$listView.View = 'Details'
$listView.FullRowSelect = $true
$listView.GridLines = $true
$listView.Size = New-Object Drawing.Size(560, 200)
$listView.Location = New-Object Drawing.Point(10,10)
$listView.Columns.Add("Étape", 120) | Out-Null
$listView.Columns.Add("Description", 300) | Out-Null
$listView.Columns.Add("État", 100) | Out-Null
$form.Controls.Add($listView)

$progress = New-Object Windows.Forms.ProgressBar
$progress.Location = New-Object Drawing.Point(10,220)
$progress.Size = New-Object Drawing.Size(560, 25)
$progress.Minimum = 0
$progress.Maximum = 100
$form.Controls.Add($progress)

$btn = New-Object Windows.Forms.Button
$btn.Text = "Lancer l'installation"
$btn.Location = New-Object Drawing.Point(220,260)
$btn.Size = New-Object Drawing.Size(150,30)
$form.Controls.Add($btn)

$btn.Add_Click({
    $ErrorActionPreference = "Stop"
    try {
        # Télécharger Python
        $src = "C:\\Sources"
        if (-not (Test-Path $src)) {
            New-Item -ItemType Directory -Path $src -Force | Out-Null
        }
        $pythonUrl = "https://www.python.org/ftp/python/3.13.5/python-3.13.5-amd64.exe"
        $installerPath = "$src\\python-3.13.5-amd64.exe"
        Add-Step "2.1" "Téléchargement de Python" "..."
        Invoke-WebRequest -Uri $pythonUrl -OutFile $installerPath -UseBasicParsing
        Add-Step "2" "Installeur Python téléchargé" "OK"
        Update-Progress 40

        # Installer Python
        Add-Step "3.1" "Installation silencieuse Python" "..."
        Start-Process -FilePath $installerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 Include_test=0" -Wait
        Remove-Item $installerPath -Force
        Add-Step "3" "Python installé avec succès" "OK"
        Update-Progress 60

        # Installer Flask
        Add-Step "4.1" "Installation de Flask via pip" "..."
        pip install flask
        Add-Step "4" "Flask installé avec succès" "OK"
        Update-Progress 100
    } catch {
        Add-Step "ERREUR" $_.Exception.Message "Err"
    }
})

$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
