                     -1,
                     FrameworkPropertyMetadataOptions.AffectsRender));
 
        public static readonly DependencyProperty TextBrushProperty =
            DependencyProperty.Register(
                "TextBrush",
                typeof(Brush),
                typeof(SliderInfoAdorner),
                new FrameworkPropertyMetadata(
                    new SolidColorBrush((Color)((App)Application.Current).ThemeDictionary["Text_2"]),
                    FrameworkPropertyMetadataOptions.AffectsRender));

        public static readonly DependencyProperty BackgroundBrushProperty =
            DependencyProperty.Register(
                "BackgroundBrush",
                typeof(Brush),
                typeof(SliderInfoAdorner),
                new FrameworkPropertyMetadata(
                    new SolidColorBrush((Color)((App)Application.Current).ThemeDictionary["Popup_Idle_1"]),
                    FrameworkPropertyMetadataOptions.AffectsRender));

 
         public double Maximum
         {
             set { SetValue(IndexProperty, value); }
         }
 
        public Brush TextBrush
         {
            get { return (Brush)GetValue(TextBrushProperty); }
            set { SetValue(TextBrushProperty, value); }
         }
 
        public Brush BackgroundBrush
         {
            get { return (Brush)GetValue(BackgroundBrushProperty); }
            set { SetValue(BackgroundBrushProperty, value); }
         }
 
 
             SetBinding(ShowNextRangeProperty, new Binding("ShowNextRange") { Source = adornedElement, });
         }
 

         protected override void OnRender(DrawingContext drawingContext)
         {
             if (AdornedElement is SliderPart slider)
                         FlowDirection.LeftToRight,
                         typeFace,
                         textSize,
                        TextBrush)
                     {
                         MaxTextWidth = maxTextWidth,
                     };
                         ? -formattedText.Height + (slider.ActualHeight - track.Thumb.ActualHeight)
                         : (slider.ActualHeight - track.Thumb.ActualHeight) + track.Thumb.ActualHeight;
                     // draw
                    if (top) drawingContext.DrawRectangle(BackgroundBrush, null, new Rect(x, y, formattedText.Width, formattedText.Height));
                     drawingContext.DrawText(formattedText, new Point(x, y));
                 }
 
                 typeof(SliderPart),
                 new FrameworkPropertyMetadata(
                     null,
                    FrameworkPropertyMetadataOptions.AffectsRender,
                    propertyChangedCallback: ExtSliderChangedCallback));

        private static void ExtSliderChangedCallback(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var @this = (SliderPart)d;
            var bgBinding = new MultiBinding() { Converter = new GradientStopsConverter() };
            bgBinding.Bindings.Add(new Binding("BackgroundGradientBrushes") { Source = e.NewValue });
            bgBinding.Bindings.Add(new Binding("Values") { Source = e.NewValue });
            bgBinding.Bindings.Add(new Binding("Minimum") { Source = e.NewValue });
            bgBinding.Bindings.Add(new Binding("Maximum") { Source = e.NewValue });
            @this.SetBinding(BackgroundProperty, bgBinding);

            @this._infoAdorner = new SliderInfoAdorner(@this);
            AdornerLayer.GetAdornerLayer(@this).Add(@this._infoAdorner);
            var prBinding = new MultiBinding() { Converter = new ElementAtConverter<bool>(fallbackPredicateIndex: index => index != 0) };
            prBinding.Bindings.Add(new Binding("ShowRanges") { Source = e.NewValue });
            prBinding.Bindings.Add(new Binding("Index") { Source = @this });
            @this._infoAdorner.SetBinding(SliderInfoAdorner.ShowPrevRangeProperty, prBinding);
            var nrBinding = new MultiBinding() { Converter = new ElementAtConverter<bool>(indexTransform: index => index + 1) };
            nrBinding.Bindings.Add(new Binding("ShowRanges") { Source = e.NewValue });
            nrBinding.Bindings.Add(new Binding("Index") { Source = @this });
            @this._infoAdorner.SetBinding(SliderInfoAdorner.ShowNextRangeProperty, nrBinding);
            @this._infoAdorner.SetBinding(SliderInfoAdorner.RangesProperty, new Binding("Ranges") { Source = e.NewValue });
        }
 
         public static readonly DependencyProperty TrackVisibilityProperty =
             DependencyProperty.Register(
         }
 
 
        private Adorner? _infoAdorner;


         static SliderPart()
         {
             ValueProperty.OverrideMetadata(
         {
             SetBinding(RangeProperty, new Binding("Value") { Source = this, Converter = new ValueToRangeConverter(previousPart), Mode = BindingMode.TwoWay });
             SetBinding(TrackVisibilityProperty, new Binding("Index") { Source = this, Converter = new IndexToTrackVisibilityConverter(), Mode = BindingMode.OneWay });
         }
 
         private static void ValuepropertyChangedCallback(DependencyObject d, DependencyPropertyChangedEventArgs e)