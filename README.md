## Installation

To install the project on a Raspberry Pi, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/wiggle-bin/wiggle-installer.git .
    ```

2. Navigate to the project directory:

    ```bash
    cd wiggle-installer
    ```

3. Make the `install.sh` script executable:

    ```bash
    chmod +x install.sh
    ```

4. Run the `install.sh` script:

    ```bash
    ./install.sh
    ```

    This script will handle the installation process and set up any necessary dependencies.

5. Follow any additional instructions provided by the script.

Once the installation is complete, you can proceed with using the project on your Raspberry Pi.

## Checking on services

List all Wiggle services:

```bash
systemctl --user list-units --type=service | grep 'wiggle'
```

You can check the status with:

```bash
systemctl --user status [name].service
```

To stop the service run:

```bash
systemctl --user stop [name].service
```

To start the service run:

```bash
systemctl --user start [name].service
```

Watching output of the service:

```bash
journalctl --user-unit=[name].service -f
```

List all the timers

```bash
systemctl --user list-timers
```