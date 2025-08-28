             var rect = new Rectangle((int)mousePosition.X, (int)mousePosition.Y, 1, 1);
             using (var bmp = new Bitmap(rect.Width, rect.Height, PixelFormat.Format32bppArgb))
             {
                using (var g = Graphics.FromImage(bmp)) // Ensure Graphics object is disposed
                {
                    g.CopyFromScreen(rect.Left, rect.Top, 0, 0, bmp.Size, CopyPixelOperation.SourceCopy);
                }
 
                 return bmp.GetPixel(0, 0);
             }