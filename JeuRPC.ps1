<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    JeuRPC
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Font                    = 'Verdana,10'
$FontBtn                 = 'Verdana,10,style=Bold'
$FontLabel               = 'Verdana,16,style=Bold'
$imgDir                  = "$PSScriptRoot\img"
$imgDefault              = "$imgDir\default.png"
$imgRoche                = "$imgDir\roche.png"
$imgPapier               = "$imgDir\papier.png"
$imgCiseau               = "$imgDir\ciseau.png"
$imgRocheInv             = "$imgDir\rocheInv.png"
$imgPapierInv            = "$imgDir\papierInv.png"
$imgCiseauInv            = "$imgDir\ciseauInv.png"
$Global:FichierLizemoi   = "$PSScriptRoot\lisezmoi.txt"
$Global:FichierLog       = "$PSScriptRoot\log.txt"
$Global:Matches          = 0
$Global:ScoreVous        = 0
$Global:ScoreAdv         = 0

$frmJeuRPC                       = New-Object system.Windows.Forms.Form
$frmJeuRPC.ClientSize            = '480,520'
$frmJeuRPC.text                  = "Jeu: Rroche x Papier x Ciseau par Abner S. Torres"
$frmJeuRPC.BackColor             = "White"
$frmJeuRPC.TopMost               = $True
$frmJeuRPC.KeyPreview            = $True
$frmJeuRPC.StartPosition         = "CenterScreen"
$frmJeuRPC.Icon                  = "$imgDir\fierbourg.ico"
$frmJeuRPC.MaximumSize           = $frmJeuRPC.Size
$frmJeuRPC.MinimumSize           = $frmJeuRPC.Size

#
# tabControl
#
$tabControl            = New-object System.Windows.Forms.TabControl
$tabControl.Location   = '0, 0' # position
$tabControl.Name       = "tabControl"
$tabControl.Size       = $frmJeuRPC.Size
$tabControl.TabIndex   = 0 # sélectionné le tabpage1 par défaut
$tabControl.Appearance = "Button" # permet de de rendre les TabPage d'une couleur unie
$tabControl.Alignment  = "Top" # Place les Tab en haut (c'est la valeur par défaut), on peut mettre Right ou Left aussi

#
# les différents TabPage de tabControl
#

# TabPage1
$tabPage1            = New-Object System.Windows.Forms.TabPage
$tabPage1.Name       = 'tabpage1'
$tabPage1.Text       = 'Jeu'
#$tabPage1.BackColor  = "LightCoral"
$tabPage1.TabIndex   = 0 
$tabPage1.Enabled    = $true # Permet de sélectionner un objet sur ce tab

# TabPage2
$tabPage2            = New-Object System.Windows.Forms.TabPage
$tabPage2.Name       = 'tabpage2'
$tabPage2.Text       = 'Réegles du jeu et Lisez-moi.txt'
#$tabPage2.BackColor  = "LightGreen"
$tabPage2.TabIndex   = 1
$tabPage2.Enabled    = $true # Empêche de sélectionner un objet sur ce tab

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
$pbRoche.imageLocation           = "$imgRoche"
$pbRoche.SizeMode                = [System.Windows.Forms.PictureBoxSizeMode]::zoom


$pbPapier                        = New-Object system.Windows.Forms.PictureBox
$pbPapier.width                  = 60
$pbPapier.height                 = 48
$pbPapier.location               = New-Object System.Drawing.Point(200,80)
$pbPapier.imageLocation          = "$imgPapier"
$pbPapier.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$pbCiseau                        = New-Object system.Windows.Forms.PictureBox
$pbCiseau.width                  = 60
$pbCiseau.height                 = 48
$pbCiseau.location               = New-Object System.Drawing.Point(317,80)
$pbCiseau.imageLocation          = "$imgCiseau"
$pbCiseau.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$gbRadio                         = New-Object system.Windows.Forms.Groupbox
$gbRadio.height                  = 30
$gbRadio.width                   = 320
$gbRadio.location                = New-Object System.Drawing.Point(65,125)

$rbtRoche                        = New-Object system.Windows.Forms.RadioButton
$rbtRoche.AutoSize               = $true
$rbtRoche.width                  = 100
$rbtRoche.height                 = 20
$rbtRoche.location               = New-Object System.Drawing.Point(10,8)
$rbtRoche.Text                   = "Roche"
$rbtRoche.Font                   = $Font

$rbtRoche.Checked                = $true

$rbtPapier                       = New-Object system.Windows.Forms.RadioButton
$rbtPapier.AutoSize              = $true
$rbtPapier.width                 = 104
$rbtPapier.height                = 20
$rbtPapier.location              = New-Object System.Drawing.Point(135,8)
$rbtPapier.Text                  = "Papier"
$rbtPapier.Font                  = $Font

$rbtCiseau                       = New-Object system.Windows.Forms.RadioButton
$rbtCiseau.AutoSize              = $true
$rbtCiseau.width                 = 104
$rbtCiseau.height                = 20
$rbtCiseau.location              = New-Object System.Drawing.Point(250,8)
$rbtCiseau.Text                  = "Ciseau"
$rbtCiseau.Font                  = $Font

$gbResult                         = New-Object system.Windows.Forms.Groupbox
$gbResult.Text                    = "Résultat du match"
$gbResult.height                  = 100
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
$pbVous.imageLocation            = "$imgDefault"
$pbVous.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$pbAdversaire                    = New-Object system.Windows.Forms.PictureBox
$pbAdversaire.width              = 60
$pbAdversaire.height             = 48
$pbAdversaire.location           = New-Object System.Drawing.Point(300,40)
$pbAdversaire.imageLocation      = "$imgDefault"
$pbAdversaire.SizeMode           = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$gbScore                         = New-Object system.Windows.Forms.Groupbox
$gbScore.Text                    = "Score des jeux"
$gbScore.height                  = 45
$gbScore.width                   = 460
$gbScore.location                = New-Object System.Drawing.Point(5,380)

$lblScoreVous                    = New-Object system.Windows.Forms.Label
$lblScoreVous.text               = "000"
$lblScoreVous.AutoSize           = $true
$lblScoreVous.width              = 25
$lblScoreVous.height             = 10
$lblScoreVous.location           = New-Object System.Drawing.Point(120,10)
$lblScoreVous.Font               = $FontLabel

$lblScoreAdv                     = New-Object system.Windows.Forms.Label
$lblScoreAdv.text                = "000"
$lblScoreAdv.AutoSize            = $true
$lblScoreAdv.width               = 25
$lblScoreAdv.height              = 10
$lblScoreAdv.location            = New-Object System.Drawing.Point(310,10)
$lblScoreAdv.Font                = $FontLabel

$btnJouer                        = New-Object system.Windows.Forms.Button
$btnJouer.text                   = "JOUER"
$btnJouer.width                  = 185
$btnJouer.height                 = 30
$btnJouer.location               = New-Object System.Drawing.Point(134,160)
$btnJouer.Font                   = $FontBtn

$rtbAction                     = New-Object system.Windows.Forms.RichTextBox
$rtbAction.multiline           = $True
$rtbAction.Enabled             = $False
$rtbAction.width               = 460
$rtbAction.height              = 80
$rtbAction.location            = New-Object System.Drawing.Point(10,195)
$rtbAction.Font                = $Font

$lblRegles                         = New-Object system.Windows.Forms.Label
$lblRegles.text                    = "Règles de jeu"
$lblRegles.AutoSize                = $true
$lblRegles.width                   = 25
$lblRegles.height                  = 10
$lblRegles.location                = New-Object System.Drawing.Point(160,5)
$lblRegles.Font                    = $FontLabel

$lblGagnant                   = New-Object system.Windows.Forms.Label
$lblGagnant.text              = "Le gagnant est en vert"
$lblGagnant.AutoSize          = $true
$lblGagnant.width             = 25
$lblGagnant.height            = 10
$lblGagnant.location          = New-Object System.Drawing.Point(100,125)
$lblGagnant.Font              = $FontLabel

$txtRegles                       = New-Object system.Windows.Forms.RichTextBox
$txtRegles.multiline             = $True
$txtRegles.Enabled               = $False
$txtRegles.width                 = 465
$txtRegles.height                = 70
$txtRegles.location              = New-Object System.Drawing.Point(5,40)
$txtRegles.Font                  = $Font
$txtRegles.Text                  = "Une fois à trois les joueurs révèlent leur main (roche, papier ou ciseau) en même temps. La plus forte des formes l'emporte et le joueur marque le point gagnant. Si les deux joueurs utilisent la même forme c'est un match nul."

$pbRegles                        = New-Object system.Windows.Forms.PictureBox
$pbRegles.width                  = 340
$pbRegles.height                 = 120
$pbRegles.location               = New-Object System.Drawing.Point(60,150)
$pbRegles.imageLocation          = "$imgDir\regles.png"
$pbRegles.SizeMode               = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$btnFinir                        = New-Object system.Windows.Forms.Button
$btnFinir.text                   = "FINIR ET ENREGISTRER LE LOG"
$btnFinir.width                  = 260
$btnFinir.height                 = 40
$btnFinir.location               = New-Object System.Drawing.Point(5,440)
$btnFinir.Font                   = $FontBtn

$btnLog                        = New-Object system.Windows.Forms.Button
$btnLog.text                   = "OUVRIR LE LOG"
$btnLog.width                  = 175
$btnLog.height                 = 40
$btnLog.location               = New-Object System.Drawing.Point(290,440)
$btnLog.Font                   = $FontBtn
$btnLog.Enabled                = $False

$btnLisezMoi                        = New-Object system.Windows.Forms.Button
$btnLisezMoi.text                   = "Ouvrir Lizezmoi.txt"
$btnLisezMoi.width                  = 260
$btnLisezMoi.height                 = 40
$btnLisezMoi.location               = New-Object System.Drawing.Point(100,290)
$btnLisezMoi.Font                   = $FontBtn

# Ajouter les contrôles au formulaire
$frmJeuRPC.controls.AddRange(@($tabControl))

# Ajouter les contrôles à tabControl
$tabControl.Controls.AddRange(@($tabPage1, $tabPage2)) # addrange permet d'ajouter plusieurs objets en même temps

$gbRadio.controls.AddRange(@($rbtRoche,$rbtPapier,$rbtCiseau))
$gbResult.controls.AddRange(@($lblVous,$lblAdversaire,$lblVersus,$pbVous,$pbAdversaire))
$gbScore.controls.AddRange(@($lblScoreVous,$lblScoreAdv))

# Ajouter les contrôles à TabPage1
$TabPage1.Controls.AddRange(@($lblTitile,$btnRoche,$btnCiseau,$btnPapier,$pbRoche,$pbPapier,$pbCiseau,$gbRadio,$gbResult,$gbScore,$btnJouer,$rtbAction,$gbResult,$gbScore,$btnFinir,$btnLog))

# Ajouter les contrôles à TabPage2
$TabPage2.Controls.AddRange(@($txtRegles,$pbRegles,$lblRegles, $lblGagnant,$btnLisezMoi))


$btnRoche.Add_Click({ $rbtRoche.Checked = $True})
$btnPapier.Add_Click({ $rbtPapier.Checked = $True})
$btnCiseau.Add_Click({ $rbtCiseau.Checked = $True})
$pbRoche.Add_Click({ $rbtRoche.Checked = $True})
$pbPapier.Add_Click({ $rbtPapier.Checked = $True})
$pbCiseau.Add_Click({ $rbtCiseau.Checked = $True})

$btnJouer.Add_Click({ 
    $Vous = ChoixVous
    $Adver = ChoixAdver 
    $Gagnant = $(Jouer $Vous $Adver)
    $Global:Matches += 1
    AfficheAction("Matche: $($Global:Matches.ToString("000")) `t`| Vous: $Vous `t`| Adversaire: $Adver `t`| Gagnant: $Gagnant")
    if($Gagnant -eq "Vous"){
        $Global:ScoreVous += 1
        $lblScoreVous.Text = $Global:ScoreVous.ToString("000")
    }
    if($Gagnant -eq "Adversaire"){
        $Global:ScoreAdv += 1
        $lblScoreAdv.Text = $Global:ScoreAdv.ToString("000")
    }

})

$btnLisezMoi.Add_Click({ Notepad $Global:FichierLizemoi})

$btnLog.Add_Click({ 
                      if(Test-Path "$Global:FichierLog"){
                            Notepad "$Global:FichierLog"
                        }
                      else{
                            [System.Windows.MessageBox]::Show("Le log.txt n'a pas été enregistré!","Error !","Ok","Error")
                      }
    
                  })

$btnFinir.Add_Click({
                       if($lblScoreVous.Text -gt $lblScoreAdv.Text){
                        $GagnantJeu = "Vous"
                       }
                       elseif($lblScoreVous.Text -lt $lblScoreAdv.Text){
                        $GagnantJeu = "Adversaire"
                       }
                       else{
                        $GagnantJeu = "Égalité"
                       }

                       AfficheAction("Score final - Vous: $($lblScoreVous.Text) `t`| Adversaire: $($lblScoreAdv.Text) `t`| Gagnant du Jeu: $GagnantJeu")
                       $rtbAction.text | Out-File $Global:FichierLog -Force
                       $btnLog.Enabled = $True
                       $btnJouer.Enabled = $False
                    }) 
# Permet de quitter le script avec la touche Échap
$frmJeuRPC.Add_KeyDown( {  
    if ($_.KeyCode -eq "Escape") { 
        $frmJeuRPC.Close() 
        }   
} )

#endregion événements }

function Jouer {
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $ChoixVous,
         [Parameter(Mandatory=$true, Position=1)]
         [string]$ChoixAdversaire
    )
  If ($ChoixVous -eq "Roche" -AND $ChoixAdversaire -eq "Papier")
    {
        $Gagnant = "Adversaire"
    }
    elseif($ChoixVous -eq "Roche" -AND $ChoixAdversaire -eq "Ciseau")
    {
        $Gagnant = "Vous"
    }
    elseif($ChoixVous -eq "Papier" -AND $ChoixAdversaire -eq "Roche")
    {
        $Gagnant = "Vous"
    }
    elseif($ChoixVous -eq "Papier" -AND $ChoixAdversaire -eq "Ciseau")
    {
        $Gagnant = "Adversaire"
    }
    elseif($ChoixVous -eq "Ciseau" -AND $ChoixAdversaire -eq "Roche")
    {
        $Gagnant = "Adversaire"
    }
    elseif($ChoixVous -eq "Ciseau" -AND $ChoixAdversaire -eq "Papier")
    {
        $Gagnant = "Vous"
    }
    else
    {
        $Gagnant = "Egalite"
    }
    return $Gagnant
}

function ChoixVous {
 for ($i = 0; $i -lt 3; $i++)
    { 
        if($gbRadio.Controls[$i].Checked){
            $Choix = $gbRadio.Controls[$i].Text
              switch ($Choix)
              {
                 'Roche' {$pbVous.imageLocation = $imgRoche}
                 'Papier' {$pbVous.imageLocation = $imgPapier}
                 Default {$pbVous.imageLocation = $imgCiseau}
              }
#            AfficheAction("Vous avez choisi: $Choix")
            return $Choix
        }
    }
}

function ChoixAdver {
  Switch (Get-Random -Minimum 1 -Maximum 4)
  {
	  '1' {$Choix = "Roche"}
	  '2' {$Choix = "Papier"}
	  Default {$Choix = "Ciseau"}
  }
  switch ($Choix)
     {
         'Roche' {$pbAdversaire.imageLocation = $imgRocheInv}
         'Papier' {$pbAdversaire.imageLocation = $imgPapierInv}
         Default {$pbAdversaire.imageLocation = $imgCiseauInv}
     }
#  AfficheAction("L'Adversaire a choisi: $Choix")
  return $Choix
}

#
# Pour utiliser cette fonction, par ex.:
#                               AfficheAction("Voici mon message à afficher dans la boite de texte Action")
#
function AfficheAction ($Message) {
        $MessageTime = $(get-date -uformat '%y-%m-%d %Hh%mm')
        $rtbAction.text += $(get-date -uformat '%y-%m-%d %Hh%mm - ') + "$Message`n"
        $rtbAction.SelectionStart= $rtbAction.Text.Length # Permet de mettre le curseur à la dernière ligne
        $rtbAction.ScrollToCaret()                        # du RichTextBox Action
}

# À l'affchage du formulaire, on fait... 
$frmJeuRPC.Add_Shown({
        $Global:Matches= 0
    })

[void]$frmJeuRPC.ShowDialog()