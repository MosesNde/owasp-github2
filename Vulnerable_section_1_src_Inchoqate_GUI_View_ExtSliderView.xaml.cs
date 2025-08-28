                     -1,
                     FrameworkPropertyMetadataOptions.AffectsRender));
 
 
         public double Maximum
         {
             set { SetValue(IndexProperty, value); }
         }
 
        public Brush TextColor
         {
            get => new SolidColorBrush((Color)((App)Application.Current).ThemeDictionary["Text_2"]);
         }
 
        public Brush BackgroundColor
         {
            get => new SolidColorBrush((Color)((App)Application.Current).ThemeDictionary["Popup_Idle_1"]);
         }
 
 
             SetBinding(ShowNextRangeProperty, new Binding("ShowNextRange") { Source = adornedElement, });
         }
 
         protected override void OnRender(DrawingContext drawingContext)
         {
             if (AdornedElement is SliderPart slider)
                         FlowDirection.LeftToRight,
                         typeFace,
                         textSize,
                        TextColor)
                     {
                         MaxTextWidth = maxTextWidth,
                     };
                         ? -formattedText.Height + (slider.ActualHeight - track.Thumb.ActualHeight)
                         : (slider.ActualHeight - track.Thumb.ActualHeight) + track.Thumb.ActualHeight;
                     // draw
                    if (top) drawingContext.DrawRectangle(BackgroundColor, null, new Rect(x, y, formattedText.Width, formattedText.Height));
                     drawingContext.DrawText(formattedText, new Point(x, y));
                 }
 
                 typeof(SliderPart),
                 new FrameworkPropertyMetadata(
                     null,
                    FrameworkPropertyMetadataOptions.AffectsRender));
 
         public static readonly DependencyProperty TrackVisibilityProperty =
             DependencyProperty.Register(
         }
 
 
         static SliderPart()
         {
             ValueProperty.OverrideMetadata(
         {
             SetBinding(RangeProperty, new Binding("Value") { Source = this, Converter = new ValueToRangeConverter(previousPart), Mode = BindingMode.TwoWay });
             SetBinding(TrackVisibilityProperty, new Binding("Index") { Source = this, Converter = new IndexToTrackVisibilityConverter(), Mode = BindingMode.OneWay });
            Loaded += LoadedHandler;
        }

        private void LoadedHandler(object sender, RoutedEventArgs e)
        {
            var adorner = new SliderInfoAdorner(this);
            AdornerLayer.GetAdornerLayer(this).Add(adorner);
            var prBinding = new MultiBinding() { Converter = new ElementAtConverter<bool>(fallbackPredicateIndex: index => index != 0) };
            prBinding.Bindings.Add(new Binding("ShowRanges") { Source = ExtSlider });
            prBinding.Bindings.Add(new Binding("Index") { Source = this });
            adorner.SetBinding(SliderInfoAdorner.ShowPrevRangeProperty, prBinding);
            var nrBinding = new MultiBinding() { Converter = new ElementAtConverter<bool>(indexTransform: index => index + 1) };
            nrBinding.Bindings.Add(new Binding("ShowRanges") { Source = ExtSlider });
            nrBinding.Bindings.Add(new Binding("Index") { Source = this });
            adorner.SetBinding(SliderInfoAdorner.ShowNextRangeProperty, nrBinding);
            adorner.SetBinding(SliderInfoAdorner.RangesProperty, new Binding("Ranges") { Source = ExtSlider });

            var bgBinding = new MultiBinding() { Converter = new GradientStopsConverter() };
            bgBinding.Bindings.Add(new Binding("BackgroundGradientBrushes") { Source = ExtSlider });
            bgBinding.Bindings.Add(new Binding("Values") { Source = ExtSlider });
            bgBinding.Bindings.Add(new Binding("Minimum") { Source = ExtSlider });
            bgBinding.Bindings.Add(new Binding("Maximum") { Source = ExtSlider });
            SetBinding(BackgroundProperty, bgBinding);
         }
 
         private static void ValuepropertyChangedCallback(DependencyObject d, DependencyPropertyChangedEventArgs e)