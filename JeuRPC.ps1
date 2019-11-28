<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    JeuRPC
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Font = 'Verdana,10'
$FontBtn = 'Verdana,10,style=Bold'
$FontLabel = 'Verdana,16,style=Bold'

$frmJeuRPC                       = New-Object system.Windows.Forms.Form
$frmJeuRPC.ClientSize            = '480,720'
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
$lblTitile.location              = New-Object System.Drawing.Point(45,5)
$lblTitile.Font                  = 'Verdana,20,style=Bold'

$btnRoche                        = New-Object system.Windows.Forms.Button
$btnRoche.text                   = "Roche"
$btnRoche.width                  = 80
$btnRoche.height                 = 30
$btnRoche.location               = New-Object System.Drawing.Point(65,50)
$btnRoche.Font                   = $FontBtn

$btnCiseau                       = New-Object system.Windows.Forms.Button
$btnCiseau.text                  = "Ciseau"
$btnCiseau.width                 = 80
$btnCiseau.height                = 30
$btnCiseau.location              = New-Object System.Drawing.Point(305,50)
$btnCiseau.Font                  = $FontBtn

$btnPapier                       = New-Object system.Windows.Forms.Button
$btnPapier.text                  = "Papier"
$btnPapier.width                 = 80
$btnPapier.height                = 30
$btnPapier.location              = New-Object System.Drawing.Point(190,50)
$btnPapier.Font                  = $FontBtn


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
$gbRadio.location                = New-Object System.Drawing.Point(75,125)

$rdbRoche                        = New-Object system.Windows.Forms.RadioButton
$rdbRoche.AutoSize               = $true
$rdbRoche.width                  = 104
$rdbRoche.height                 = 20
$rdbRoche.location               = New-Object System.Drawing.Point(25,8)
$rdbRoche.Font                   = $Font

$rbtPapier                       = New-Object system.Windows.Forms.RadioButton
$rbtPapier.AutoSize              = $true
$rbtPapier.width                 = 104
$rbtPapier.height                = 20
$rbtPapier.location              = New-Object System.Drawing.Point(150,8)
$rbtPapier.Font                  = $Font

$rbtCiseau                       = New-Object system.Windows.Forms.RadioButton
$rbtCiseau.AutoSize              = $true
$rbtCiseau.width                 = 104
$rbtCiseau.height                = 20
$rbtCiseau.location              = New-Object System.Drawing.Point(270,8)
$rbtCiseau.Font                  = $Font

$gbResult                         = New-Object system.Windows.Forms.Groupbox
$gbResult.Text                    = "Résultat du match"
$gbResult.height                  = 90
$gbResult.width                   = 460
$gbResult.location                = New-Object System.Drawing.Point(5,280)

$lblVous                         = New-Object system.Windows.Forms.Label
$lblVous.text                    = "Vous"
$lblVous.AutoSize                = $true
$lblVous.width                   = 25
$lblVous.height                  = 10
$lblVous.location                = New-Object System.Drawing.Point(110,5)
$lblVous.Font                    = $FontLabel

$lblVersus                       = New-Object system.Windows.Forms.Label
$lblVersus.text                  = "X"
$lblVersus.AutoSize              = $true
$lblVersus.width                 = 25
$lblVersus.height                = 10
$lblVersus.location              = New-Object System.Drawing.Point(210,40)
$lblVersus.Font                  = $FontLabel

$lblAdversaire                   = New-Object system.Windows.Forms.Label
$lblAdversaire.text              = "Adversaire"
$lblAdversaire.AutoSize          = $true
$lblAdversaire.width             = 25
$lblAdversaire.height            = 10
$lblAdversaire.location          = New-Object System.Drawing.Point(270,5)
$lblAdversaire.Font              = $FontLabel

$pbVous                          = New-Object system.Windows.Forms.PictureBox
$pbVous.width                    = 60
$pbVous.height                   = 48
$pbVous.location                 = New-Object System.Drawing.Point(110,40)
$pbVous.imageLocation            = "$PSScriptRoot\img\default.png"
$pbVous.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$pbAdversaire                    = New-Object system.Windows.Forms.PictureBox
$pbAdversaire.width              = 60
$pbAdversaire.height             = 48
$pbAdversaire.location           = New-Object System.Drawing.Point(300,40)
$pbAdversaire.imageLocation      = "$PSScriptRoot\img\default.png"
$pbAdversaire.SizeMode           = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$gbScore                         = New-Object system.Windows.Forms.Groupbox
$gbScore.Text                    = "Score des jeux"
$gbScore.height                  = 40
$gbScore.width                   = 460
$gbScore.location                = New-Object System.Drawing.Point(5,370)

$lblScoreVous                    = New-Object system.Windows.Forms.Label
$lblScoreVous.text               = "00"
$lblScoreVous.AutoSize           = $true
$lblScoreVous.width              = 25
$lblScoreVous.height             = 10
$lblScoreVous.location           = New-Object System.Drawing.Point(120,5)
$lblScoreVous.Font               = $FontLabel

$lblScoreAdv                     = New-Object system.Windows.Forms.Label
$lblScoreAdv.text                = "00"
$lblScoreAdv.AutoSize            = $true
$lblScoreAdv.width               = 25
$lblScoreAdv.height              = 10
$lblScoreAdv.location            = New-Object System.Drawing.Point(310,5)
$lblScoreAdv.Font                = $FontLabel

$btnJouer                        = New-Object system.Windows.Forms.Button
$btnJouer.text                   = "JOUER"
$btnJouer.width                  = 185
$btnJouer.height                 = 30
$btnJouer.location               = New-Object System.Drawing.Point(134,160)
$btnJouer.Font                   = $FontBtn

$txtMessages                     = New-Object system.Windows.Forms.RichTextBox
$txtMessages.multiline           = $True
$txtMessages.Enabled             = $False
$txtMessages.width               = 460
$txtMessages.height              = 80
$txtMessages.location            = New-Object System.Drawing.Point(10,195)
$txtMessages.Font                = $Font

$lblRegles                         = New-Object system.Windows.Forms.Label
$lblRegles.text                    = "Règles de jeu"
$lblRegles.AutoSize                = $true
$lblRegles.width                   = 25
$lblRegles.height                  = 10
$lblRegles.location                = New-Object System.Drawing.Point(160,415)
$lblRegles.Font                    = $FontLabel

$lblGagnant                   = New-Object system.Windows.Forms.Label
$lblGagnant.text              = "Le gagnant est en vert"
$lblGagnant.AutoSize          = $true
$lblGagnant.width             = 25
$lblGagnant.height            = 10
$lblGagnant.location          = New-Object System.Drawing.Point(100,525)
$lblGagnant.Font              = $FontLabel

$txtRegles                       = New-Object system.Windows.Forms.RichTextBox
$txtRegles.multiline             = $True
$txtRegles.Enabled               = $False
$txtRegles.width                 = 465
$txtRegles.height                = 70
$txtRegles.location              = New-Object System.Drawing.Point(5,440)
$txtRegles.Font                  = $Font
$txtRegles.Text                  = "Une fois à trois les joueurs révèlent leur main (roche, papier ou ciseau) en même temps. La plus forte des formes l'emporte et le joueur marque le point gagnant. Si les deux joueurs utilisent la même forme c'est un match nul."

$pbRegles                        = New-Object system.Windows.Forms.PictureBox
$pbRegles.width                  = 340
$pbRegles.height                 = 120
$pbRegles.location               = New-Object System.Drawing.Point(60,550)
$pbRegles.imageLocation          = "$PSScriptRoot\img\regles.png"
$pbRegles.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$btnFinir                        = New-Object system.Windows.Forms.Button
$btnFinir.text                   = "FINIR ET ENREGISTRER LE LOG"
$btnFinir.width                  = 260
$btnFinir.height                 = 40
$btnFinir.location               = New-Object System.Drawing.Point(100,670)
$btnFinir.Font                   = $FontBtn

$frmJeuRPC.controls.AddRange(@($btnRoche,$lblTitile,$btnCiseau,$btnPapier,$pbRoche,$pbPapier,$pbCiseau,$gbRadio,$gbResult,$gbScore,$btnJouer,$txtMessages,$lblVous,$lblAdversaire,$lblVersus,$pbVous,$pbAdversaire,$txtRegles,$lblScoreVous,$lblScoreAdv,$pbRegles,$btnFinir,$lblRegles, $lblGagnant))
$gbRadio.controls.AddRange(@($rdbRoche,$rbtPapier,$rbtCiseau))
$gbResult.controls.AddRange(@($lblVous,$lblAdversaire,$lblVersus,$pbVous,$pbAdversaire))
$gbScore.controls.AddRange(@($lblScoreVous,$lblScoreAdv))

# Permet de quitter le script avec la touche Échap
$frmJeuRPC.Add_KeyDown( {  
    if ($_.KeyCode -eq "Escape") { 
        $frmJeuRPC.Close() 
        }   
} )

#endregion événements }

[void]$frmJeuRPC.ShowDialog()