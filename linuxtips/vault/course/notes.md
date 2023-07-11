## Initial

Initialized
Unseal

- Security
  - Root Token
  - Unseal Key

## Secrets
  - Secret engine
    KV storage model
    V1 = Doesn't have Metadata, because it doesn't have versioning enabled
    V2 = Has Versioning for Secrets

  - cubbyhole
    Token based access

  - identity

  - sys

## Basic commands

- `vault server -dev`: Initiate the basic server
  Tip: on powershell set the vault_addr variable with
  `$env:VAULT_ADDR="http://127.0.0.1:8200"`


vault server -dev -dev-listen-address=0.0.0.0:8200 -dev-root-token-id=xablau &

- `vault -autocomplete-install`

- `vault list secret_engine_path/`
    ex: vault list secret/

  - Secret management
    - `vault kv <action> secret/secret_name`
      vault kv put secret/xablau value=athos
      vault kv get secret/xablau

    - vault kv metadata <action> secret/secret_name

    - vault kv get -version=1 secret/secret_name
      vault kv delete -versions=2 secret/secret_name
      vault kv undelete -versions=1 secret/secret_name

    - vault kv put secret/opa frase=FUIIII
    - vault kv get -field frase secret/opa
    - vault kv get -field value secret/giropops
    
    # Upgrade from version 1 to version 2
    - vault kv enable-versioning secret/
    

  - Secret Engine
    - vault secrets enable <secret_engine>
    - vault secrets move <secret_engine_name> <new_secret_engine_name>

  - Authentication
    - vault auth enable userpass
    - vault write auth/userpass/users/sample_user password=foo policies=admins
    - vault login -method=userpass -path=userpass username=sample_user password=foo
    


- vault operator init
- vault operator generate-root

## Vault as Container

- Dockerfile


## Credits

  - [Descomplicando Vault - Linux Tips](https://www.linuxtips.io/course/descomplicando-o-vault)
  - [Vault by HashiCorp](https://www.vaultproject.io/)
  - [Vault Documentation](https://developer.hashicorp.com/vault/docs)