             this.menuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
             this.patchLoaderToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
             this.memoryUtilitiesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.inputdisplay = new System.Windows.Forms.Button();
             this.AutosplitterCheckbox = new System.Windows.Forms.CheckBox();
             this.bolts_textBox = new System.Windows.Forms.TextBox();
             this.label8 = new System.Windows.Forms.Label();
            this.killyourself = new System.Windows.Forms.Button();
             this.unlocksWindowButton = new System.Windows.Forms.Button();
             this.disableCutscenesCheckBox = new System.Windows.Forms.CheckBox();
             this.menuStrip1.SuspendLayout();
             this.menuToolStripMenuItem});
             this.menuStrip1.Location = new System.Drawing.Point(0, 0);
             this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(291, 24);
             this.menuStrip1.TabIndex = 76;
             this.menuStrip1.Text = "menuStrip1";
             this.menuStrip1.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.menuStrip1_ItemClicked);
             this.memoryUtilitiesToolStripMenuItem.Text = "Memory utilities";
             this.memoryUtilitiesToolStripMenuItem.Click += new System.EventHandler(this.memoryUtilitiesToolStripMenuItem_Click);
             // 
            // inputdisplay
             // 
            this.inputdisplay.Location = new System.Drawing.Point(11, 26);
            this.inputdisplay.Margin = new System.Windows.Forms.Padding(2);
            this.inputdisplay.Name = "inputdisplay";
            this.inputdisplay.Size = new System.Drawing.Size(106, 22);
            this.inputdisplay.TabIndex = 83;
            this.inputdisplay.Text = "Input Display";
            this.inputdisplay.UseVisualStyleBackColor = true;
            this.inputdisplay.Click += new System.EventHandler(this.inputdisplay_Click);
             // 
             // AutosplitterCheckbox
             // 
             this.label8.TabIndex = 105;
             this.label8.Text = "Bolt Count:";
             // 
            // killyourself
             // 
            this.killyourself.Location = new System.Drawing.Point(164, 114);
            this.killyourself.Name = "killyourself";
            this.killyourself.Size = new System.Drawing.Size(115, 23);
            this.killyourself.TabIndex = 106;
            this.killyourself.Text = "Die";
            this.killyourself.UseVisualStyleBackColor = true;
            this.killyourself.Click += new System.EventHandler(this.killyourself_Click);
             // 
             // unlocksWindowButton
             // 
             this.disableCutscenesCheckBox.AutoSize = true;
             this.disableCutscenesCheckBox.Location = new System.Drawing.Point(12, 81);
             this.disableCutscenesCheckBox.Name = "disableCutscenesCheckBox";
            this.disableCutscenesCheckBox.Size = new System.Drawing.Size(118, 17);
             this.disableCutscenesCheckBox.TabIndex = 108;
             this.disableCutscenesCheckBox.Text = "Disable cutscenes";
             this.disableCutscenesCheckBox.UseVisualStyleBackColor = true;
             // 
             this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
             this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(291, 149);
             this.Controls.Add(this.disableCutscenesCheckBox);
             this.Controls.Add(this.unlocksWindowButton);
            this.Controls.Add(this.killyourself);
             this.Controls.Add(this.label8);
             this.Controls.Add(this.bolts_textBox);
             this.Controls.Add(this.AutosplitterCheckbox);
             this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.inputdisplay);
             this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
             this.MainMenuStrip = this.menuStrip1;
             this.Name = "ACITForm";
            this.Text = "ACITForm";
             this.Load += new System.EventHandler(this.ACITForm_Load);
             this.menuStrip1.ResumeLayout(false);
             this.menuStrip1.PerformLayout();
         private System.Windows.Forms.ToolStripMenuItem menuToolStripMenuItem;
         private System.Windows.Forms.ToolStripMenuItem patchLoaderToolStripMenuItem;
         private System.Windows.Forms.ToolStripMenuItem memoryUtilitiesToolStripMenuItem;
        private System.Windows.Forms.Button inputdisplay;
         private System.Windows.Forms.Button button2;
         private System.Windows.Forms.CheckBox AutosplitterCheckbox;
         private System.Windows.Forms.TextBox bolts_textBox;
         private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button killyourself;
         private System.Windows.Forms.Button unlocksWindowButton;
         private System.Windows.Forms.CheckBox disableCutscenesCheckBox;
     }