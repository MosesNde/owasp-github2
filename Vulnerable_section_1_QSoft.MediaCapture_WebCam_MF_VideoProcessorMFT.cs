         {
             m_VideoProcessMFT_Index = streamindex;
             IMFMediaType? pMediaType=null;
            source.GetCurrentDeviceMediaType(streamindex, out pMediaType);

            //CLSID_CColorControlDmo
            var videoprocesstype = Type.GetTypeFromCLSID(DirectN.MFConstants.CLSID_VideoProcessorMFT);
            this.m_VideoProcessor = Activator.CreateInstance(videoprocesstype) as IMFVideoProcessorControl;
            HRESULT? hr = HRESULTS.S_OK;
            if(this.m_Setting.IsMirror && m_VideoProcessor != null)
             {
                //m_VideoProcessor.SetRotation(_MF_VIDEO_PROCESSOR_ROTATION.ROTATION_NORMAL);
                //hr = m_VideoProcessor?.SetRotationOverride(90);
                hr = m_VideoProcessor?.SetMirror(_MF_VIDEO_PROCESSOR_MIRROR.MIRROR_HORIZONTAL);
             }


            //HRESULT hr;
            if (m_VideoProcessor is IMFTransform mft)
             {
                hr = mft.SetInputType(0, pMediaType, 0);
                hr = mft.SetOutputType(0, pMediaType, 0);
             }

            m_TaskAddEffect = new TaskCompletionSource<HRESULT>();

            hr = source.AddEffect(streamindex, m_VideoProcessor);
            return m_TaskAddEffect.Task;
         }
        TaskCompletionSource<HRESULT>? m_TaskRemoveAllEffect;
 
         async Task<HRESULT> RemoveAllVideoProcessorMFT(IMFCaptureSource source)
         {
             m_TaskRemoveAllEffect = new();