             IntPtr NotificationFilter = Marshal.AllocHGlobal(deviceIf.dbcc_size);
             Marshal.StructureToPtr<DEV_BROADCAST_DEVICEINTERFACE>(deviceIf, NotificationFilter, true);
             this.HdevNotify = RegisterDeviceNotification(hWnd, NotificationFilter, DEVICE_NOTIFY_WINDOW_HANDLE);
 
             this.LoggerInstance?.Debug($"RegisterDeviceNotification result: 0x{this.HdevNotify:x8}");
             if (this.HdevNotify == IntPtr.Zero) this.LoggerInstance?.Debug($"GetLastError: 0x{Marshal.GetLastWin32Error():x8}");