## Execute same session on Linux
```bash
# L77
DEFAULT_SIZES = "1920x1080"
# L110
FIRST_X_DISPLAY_NUMBER = 0
# L453-454
    #while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
    #  display += 1
# L752-755
    #self._launch_x_server(x_args)
    #self._launch_x_session()
    display = self.get_unused_display_number()
    self.child_env['DISPLAY'] = f':{display}'
```

## Enable /etc/init.d/ Script

```bash
update-rc chrome-remote-desktop-patch-linux defaults
```
