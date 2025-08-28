 
         public ACITForm(acit game)
         {
            InitializeComponent();


             this.game = game;
 
            Text = $"A Crack in Time ({game.api.getGameTitleID()})";

             bolts_textBox.KeyDown += bolts_TextBox_KeyDown;
 
             if (this.game.IsAutosplitterSupported)
             {
                // This raises an event that creates the autosplitterHelper object.
                // creating it manually is not necessary and also can cause a crash
                 AutosplitterCheckbox.Checked = true;
             }
             else
             {
                AutosplitterCheckbox.Enabled = false;
             }
 
             if (this.game.HasInputDisplay)
             }
             else
             {
                inputDisplayButton.Enabled = false;
             }
             
             if (this.game.IsSelfKillSupported)
             {
                killYourselfButton.Enabled = true;
             }
             else
             {
                killYourselfButton.Enabled = false;
             }
 
             if (this.game.canRemoveCutscenes)
             else
             {
                 disableCutscenesCheckBox.Enabled = false;
             }
         }
 
 
         private void ACITForm_FormClosing(object sender, FormClosingEventArgs e)
         {
            if (autosplitterHelper != null && autosplitterHelper.IsRunning) autosplitterHelper.Stop();
            game.api.Disconnect();
             Application.Exit();
         }
 