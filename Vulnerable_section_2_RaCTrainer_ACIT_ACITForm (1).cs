 
         public ACITForm(acit game)
         {
             this.game = game;
 
            InitializeComponent();
             bolts_textBox.KeyDown += bolts_TextBox_KeyDown;
 
             if (this.game.IsAutosplitterSupported)
             {
                autosplitterHelper = new AutosplitterHelper();
                this.game.IsAutosplitterEnabled = true;
                autosplitterHelper.StartAutosplitterForGame(this.game);
                 AutosplitterCheckbox.Checked = true;
             }
             else
             {
                AutosplitterCheckbox.Hide();
             }
 
             if (this.game.HasInputDisplay)
             }
             else
             {
                inputdisplay.Enabled = false;
                inputdisplay.Hide();
             }
             
             if (this.game.IsSelfKillSupported)
             {
                killyourself.Enabled = true;
             }
             else
             {
                killyourself.Enabled = false;
                killyourself.Hide();
             }
 
             if (this.game.canRemoveCutscenes)
             else
             {
                 disableCutscenesCheckBox.Enabled = false;
                disableCutscenesCheckBox.Hide();
             }
         }
 
 
         private void ACITForm_FormClosing(object sender, FormClosingEventArgs e)
         {

             Application.Exit();
         }
 