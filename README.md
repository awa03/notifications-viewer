# Notifications Viewer
A simple lightweight script to handle your dunst notifications.

# Installation
Simply ensure the script has the adequate permissions to execute. We can do this through the following command.

```sh
cd src
chmod +x install.sh
./install.sh
```

Then run the script in order to configure, as well as view your notifications.

```sh
sudo ./history-pop.sh
```

# I3 Setup
Simply exchange your path for the example path and add the line to your i3 config file.

```sh
exec --no-startup-id ~/path/to/notification-viewer/src/history-pop.sh
```



