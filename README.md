# vault

This shell script (`vault`) that provides various functions and commands related to managing secrets and interacting with HashiCorp Vault and Azure Key Vault. The script is written in Bash and can be executed from a Bash shell environment.

## Features

The script provides the following features:

1. **Local HashiCorp Vault**: The script can start and manage a local HashiCorp Vault container, including sealing and unsealing the Vault, logging in and out, enabling secret engines, and creating and synchronizing secrets.

2. **Azure Key Vault Integration**: The script can interact with Azure Key Vault to retrieve secrets and store them in the local HashiCorp Vault. It supports copying secrets from Azure Key Vault to the local Vault.

3. **Secret Synchronization**: The script can synchronize secrets from a JSON file to the local HashiCorp Vault. It supports storing secrets in the local Vault or copying secrets from Azure Key Vault to the local Vault.

4. **Clean Up**: The script provides a `clean` function to stop and remove the local HashiCorp Vault container, along with associated Docker volumes.

5. **Environment Variables**: The script includes functions for updating the `~/.bashrc` file with local Vault Secrets.

## Usage

### JSON File

1. If the vault name is set to `local`, please use the following model to create the secret on your local Hashicorp Vault.
  ```json
    [
      {
      "vault": "local",
      "path": "hcvault/vault1",
      "local_secrets": [
        {
          "name": "mildred",
          "value": "mortag"
        },
        {
          "name": "guy",
          "value": "mortag"
        }
      ]
      }
    ]
  ```

2. If you want to sync a secret from a Azure Key Vault you can use the following structure

  ```json
    [
      {
        "vault": "akv_name1",
        "path": "akv/faber",
        "akv_secrets": [
          "books"
        ]
      }
    ]
  ```

3. Full example, you can combine the secrets anyway you want.
  ```json
  [
    {
      "vault": "akv_name1",
      "path": "akv/faber",
      "akv_secrets": [
        "books"
      ]
    },
    {
      "vault": "local",
      "path": "hcvault/vault1",
      "local_secrets": [
        {
          "name": "mildred",
          "value": "mortag"
        },
        {
          "name": "guy",
          "value": "mortag"
        }
      ]
    }
  ]
  ```

### Commands

To use the script, follow these steps:

1. Make sure you have Bash installed on your system.

2. Clone this repository or download the `vault` file.

3. Open a Bash shell and navigate to the directory containing the `vault` file.

4. Run the script with the desired command and arguments. For example:

   ```shell
   ./vault start                # Start and manage the local HashiCorp Vault container
   ./vault sync secrets.json    # Synchronize secrets from the JSON file to the local Vault
   ./vault load path/to/secrets # Load secrets from the specified path in the Vault to environment variables
   ./vault clean                # Stop and remove the local HashiCorp Vault container
   ./vault help                 # Display the help message and available commands
   ```

5. Follow the prompts and instructions provided by the script for each command.

Note: Some commands require additional setup, such as authenticating with Azure CLI (`az login`) or ensuring Docker is installed and running.

Note:
You can copy this script to your `/usr/local/bin/`, to keep on your shell path.

## Dependencies

The script relies on the following dependencies:

- Bash shell
- Docker (for managing the local HashiCorp Vault container)
- Azure CLI (for interacting with Azure Key Vault)

Please make sure these dependencies are installed and properly configured before running the script.

## Contributions

Contributions to this script are welcome! If you find any issues, have suggestions for improvements, or want to add new features, please open an issue or submit a pull request.

## Disclaimer

This script is provided as-is and without any warranty. Use it at your own risk. Please review the code and understand its implications before running it in your environment. Always ensure that you have appropriate permissions and authorization to access and manage secrets.