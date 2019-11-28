<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    JeuRPC
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Font = 'Verdana,10'


$frmJeuRPC                       = New-Object system.Windows.Forms.Form
$frmJeuRPC.ClientSize            = '480,620'
$frmJeuRPC.text                  = "Jeu: Rroche x Papier x Ciseau par Abner S. Torres"
$frmJeuRPC.BackColor             = "#d5d5d5"
$frmJeuRPC.TopMost               = $True
$frmJeuRPC.KeyPreview            = $True
$frmJeuRPC.StartPosition         = "CenterScreen"
$frmJeuRPC.Icon                  = "$PSScriptRoot\img\fierbourg.ico"
$frmJeuRPC.MaximumSize           = $frmJeuRPC.Size
$frmJeuRPC.MinimumSize           = $frmJeuRPC.Size

$lblTitile                       = New-Object system.Windows.Forms.Label
$lblTitile.text                  = "Rroche x Papier x Ciseau"
$lblTitile.AutoSize              = $true
$lblTitile.width                 = 25
$lblTitile.height                = 10
$lblTitile.location              = New-Object System.Drawing.Point(45,10)
$lblTitile.Font                  = 'Verdana,20,style=Bold'

$btnRoche                        = New-Object system.Windows.Forms.Button
$btnRoche.text                   = "Roche"
$btnRoche.width                  = 60
$btnRoche.height                 = 30
$btnRoche.location               = New-Object System.Drawing.Point(75,50)
$btnRoche.Font                   = $Font

$btnCiseau                       = New-Object system.Windows.Forms.Button
$btnCiseau.text                  = "Ciseau"
$btnCiseau.width                 = 60
$btnCiseau.height                = 30
$btnCiseau.location              = New-Object System.Drawing.Point(317,48)
$btnCiseau.Font                  = $Font


$btnPapier                       = New-Object system.Windows.Forms.Button
$btnPapier.text                  = "Papier"
$btnPapier.width                 = 60
$btnPapier.height                = 30
$btnPapier.location              = New-Object System.Drawing.Point(200,50)
$btnPapier.Font                  = $Font


$pbRoche                         = New-Object system.Windows.Forms.PictureBox
$pbRoche.width                   = 60
$pbRoche.height                  = 48
$pbRoche.location                = New-Object System.Drawing.Point(75,80)
$pbRoche.imageLocation           = "$PSScriptRoot\img\roche.png"
$pbRoche.SizeMode                = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$pbPapier                        = New-Object system.Windows.Forms.PictureBox
$pbPapier.width                  = 60
$pbPapier.height                 = 48
$pbPapier.location               = New-Object System.Drawing.Point(200,80)
$pbPapier.imageLocation          = "$PSScriptRoot\img\papier.png"
$pbPapier.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$pbCiseau                        = New-Object system.Windows.Forms.PictureBox
$pbCiseau.width                  = 60
$pbCiseau.height                 = 48
$pbCiseau.location               = New-Object System.Drawing.Point(317,80)
$pbCiseau.imageLocation          = "$PSScriptRoot\img\ciseau.png"
$pbCiseau.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom


$gbRadio                         = New-Object system.Windows.Forms.Groupbox
$gbRadio.height                  = 25
$gbRadio.width                   = 300
$gbRadio.location                = New-Object System.Drawing.Point(75,143)

$rdbRoche                        = New-Object system.Windows.Forms.RadioButton
$rdbRoche.AutoSize               = $true
$rdbRoche.width                  = 104
$rdbRoche.height                 = 20
$rdbRoche.location               = New-Object System.Drawing.Point(25,8)
$rdbRoche.Font                   = 'Verdana,10'

$rbtPapier                       = New-Object system.Windows.Forms.RadioButton
$rbtPapier.AutoSize              = $true
$rbtPapier.width                 = 104
$rbtPapier.height                = 20
$rbtPapier.location              = New-Object System.Drawing.Point(150,8)
$rbtPapier.Font                  = 'Verdana,10'

$rbtCiseau                       = New-Object system.Windows.Forms.RadioButton
$rbtCiseau.AutoSize              = $true
$rbtCiseau.width                 = 104
$rbtCiseau.height                = 20
$rbtCiseau.location              = New-Object System.Drawing.Point(270,8)
$rbtCiseau.Font                  = 'Verdana,10'

$btnJouer                        = New-Object system.Windows.Forms.Button
$btnJouer.text                   = "JOUER"
$btnJouer.width                  = 185
$btnJouer.height                 = 30
$btnJouer.location               = New-Object System.Drawing.Point(134,180)
$btnJouer.Font                   = 'Verdana,10'

$txtMessages                     = New-Object system.Windows.Forms.RichTextBox
$txtMessages.multiline           = $false
$txtMessages.width               = 460
$txtMessages.height              = 100
$txtMessages.location            = New-Object System.Drawing.Point(10,220)
$txtMessages.Font                = 'Verdana,10'

$lblVous                         = New-Object system.Windows.Forms.Label
$lblVous.text                    = "Vous"
$lblVous.AutoSize                = $true
$lblVous.width                   = 25
$lblVous.height                  = 10
$lblVous.location                = New-Object System.Drawing.Point(80,330)
$lblVous.Font                    = 'Verdana,16,style=Bold'

$lblAdversaire                   = New-Object system.Windows.Forms.Label
$lblAdversaire.text              = "Adversaire"
$lblAdversaire.AutoSize          = $true
$lblAdversaire.width             = 25
$lblAdversaire.height            = 10
$lblAdversaire.location          = New-Object System.Drawing.Point(290,330)
$lblAdversaire.Font              = 'Verdana,16,style=Bold'

$lblVersus                       = New-Object system.Windows.Forms.Label
$lblVersus.text                  = "X"
$lblVersus.AutoSize              = $true
$lblVersus.width                 = 25
$lblVersus.height                = 10
$lblVersus.location              = New-Object System.Drawing.Point(221,350)
$lblVersus.Font                  = 'Verdana,24,style=Bold'

$pbVous                          = New-Object system.Windows.Forms.PictureBox
$pbVous.width                    = 60
$pbVous.height                   = 48
$pbVous.location                 = New-Object System.Drawing.Point(80,360)
$pbVous.imageLocation            = "$PSScriptRoot\img\default.png"
$pbVous.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$pbAdversaire                    = New-Object system.Windows.Forms.PictureBox
$pbAdversaire.width              = 60
$pbAdversaire.height             = 48
$pbAdversaire.location           = New-Object System.Drawing.Point(317,360)
$pbAdversaire.imageLocation      = "$PSScriptRoot\img\default.png"
$pbAdversaire.SizeMode           = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$lblScore                        = New-Object system.Windows.Forms.Label
$lblScore.text                   = "Score du jeu"
$lblScore.AutoSize               = $true
$lblScore.width                  = 25
$lblScore.height                 = 10
$lblScore.location               = New-Object System.Drawing.Point(168,400)
$lblScore.Font                   = 'Verdana,16,style=Bold'

$lblScoreVous                    = New-Object system.Windows.Forms.Label
$lblScoreVous.text               = "00"
$lblScoreVous.AutoSize           = $true
$lblScoreVous.width              = 25
$lblScoreVous.height             = 10
$lblScoreVous.location           = New-Object System.Drawing.Point(92,420)
$lblScoreVous.Font               = 'Verdana,16,style=Bold'

$lblScoreAdv                     = New-Object system.Windows.Forms.Label
$lblScoreAdv.text                = "00"
$lblScoreAdv.AutoSize            = $true
$lblScoreAdv.width               = 25
$lblScoreAdv.height              = 10
$lblScoreAdv.location            = New-Object System.Drawing.Point(334,420)
$lblScoreAdv.Font                = 'Verdana,14,style=Bold'

$lblRegles                         = New-Object system.Windows.Forms.Label
$lblRegles.text                    = "Règles de jeu"
$lblRegles.AutoSize                = $true
$lblRegles.width                   = 25
$lblRegles.height                  = 10
$lblRegles.location                = New-Object System.Drawing.Point(5,450)
$lblRegles.Font                    = 'Verdana,12,style=Bold'

$lblGagnant                   = New-Object system.Windows.Forms.Label
$lblGagnant.text              = "Le gagnant est en vert"
$lblGagnant.AutoSize          = $true
$lblGagnant.width             = 25
$lblGagnant.height            = 10
$lblGagnant.location          = New-Object System.Drawing.Point(220,450)
$lblGagnant.Font              = 'Verdana,12,style=Bold'

$txtRegles                       = New-Object system.Windows.Forms.RichTextBox
$txtRegles.multiline             = $True
$txtRegles.width                 = 180
$txtRegles.height                = 90
$txtRegles.location              = New-Object System.Drawing.Point(4,478)
$txtRegles.Font                  = $Font
$txtRegles.Text                  = "Une fois à trois les joueurs révèlent leur main (roche, papier ou ciseau) en même temps. La plus forte des formes l'emporte et le joueur marque le point gagnant. Si les deux joueurs utilisent la même forme c'est un match nul."

$pbRegles                        = New-Object system.Windows.Forms.PictureBox
$pbRegles.width                  = 280
$pbRegles.height                 = 90
$pbRegles.location               = New-Object System.Drawing.Point(190,478)
$pbRegles.imageLocation          = "$PSScriptRoot\img\regles.png"
$pbRegles.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$btnFinir                        = New-Object system.Windows.Forms.Button
$btnFinir.text                   = "JOUER"
$btnFinir.width                  = 185
$btnFinir.height                 = 30
$btnFinir.location               = New-Object System.Drawing.Point(144,580)
$btnFinir.Font                   = 'Verdana,10'

$frmJeuRPC.controls.AddRange(@($btnRoche,$lblTitile,$btnCiseau,$btnPapier,$pbRoche,$pbPapier,$pbCiseau,$gbRadio,$btnJouer,$txtMessages,$lblVous,$lblAdversaire,$lblVersus,$pbVous,$pbAdversaire,$lblScore,$txtRegles,$lblScoreVous,$lblScoreAdv,$pbRegles,$btnFinir,$lblRegles, $lblGagnant))
$gbRadio.controls.AddRange(@($rdbRoche,$rbtPapier,$rbtCiseau))


# Permet de quitter le script avec la touche Échap
$frmJeuRPC.Add_KeyDown( {  
    if ($_.KeyCode -eq "Escape") { 
        $frmJeuRPC.Close() 
        }   
} )

#endregion événements }

[void]$frmJeuRPC.ShowDialog()