## Initial

Initialized
Unseal

- Security
  - Root Token
  - Unseal Key



## Basic commands

- `vault server -dev`: Initiate the basic server
  Tip: on powershell set the vault_addr variable with
  `$env:VAULT_ADDR="http://127.0.0.1:8200"`


vault server -dev -dev-listen-address=0.0.0.0:8200 -dev-root-token-id=giropops &

- `vault -autocomplete-install`

- `vault list secret_engine_path/`
    ex: vault list secret/

  - Secret management
    - `vault kv <action> secret/secret_name`
      vault kv put secret/xablau value=athos
      vault kv get secret/xablau


    - vault kv metadata <action> secret/secret_name

    - vault kv get -version=1 secret/secret_name
      vault kv delete -versions=1 secret/giropops
      vault kv undelete -versions=1 secret/giropops

    - vault kv put secret/opa frase=FUIIII
    - vault kv get -field frase secret/opa
    - vault kv get -field value secret/giropops


## Vault as Container

- Dockerfile
