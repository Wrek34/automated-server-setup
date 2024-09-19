# Automated Server Setup

This project contains a bash script that automates the setup of a LEMP (Linux, Nginx, MySQL, PHP) stack on a fresh Linux installation. It's designed to quickly deploy a secure web server environment.

## Features

- Updates system packages
- Installs and configures Nginx web server
- Installs PHP and necessary modules
- Installs and secures MySQL database server
- Configures a basic firewall using UFW
- Creates a sample PHP page

## Prerequisites

- A fresh installation of Ubuntu 20.04 or later
- Root access to the server

## Usage

1. Clone this repository:

   ```
   git clone https://github.com/yourusername/automated-server-setup.git
   cd automated-server-setup
   ```

2. Make the script executable:

   ```
   chmod +x setup_server.sh
   ```

3. Run the script as root:

   ```
   sudo ./setup_server.sh
   ```

4. Follow the prompts during MySQL secure installation.

5. After completion, you can access the sample PHP page at `http://your_server_ip`

**Note:** This script makes significant changes to your system. It's recommended to run it on a fresh installation or in a controlled environment.

## Customization

You can customize the script by modifying the `setup_server.sh` file. Some possible customizations include:

- Changing the web server from Nginx to Apache
- Installing additional PHP modules
- Setting up virtual hosts
- Implementing more advanced security measures

## Security Considerations

This script implements basic security measures, including:

- Updating all system packages
- Securing MySQL installation
- Setting up a basic firewall

For production environments, additional security measures should be implemented.

## Contributing

Contributions to improve the script are welcome. Please feel free to submit a Pull Request.

## License

[MIT License](LICENSE)

## Author

Wrek
