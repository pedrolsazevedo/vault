FROM vault:latest AS base

COPY ./config/vault.hcl /hc-vault/vault.hc

ENV VAULT_ADDR=http://127.0.0.1:8200
ENV VAULT_API_ADDR=http://127.0.0.1:8200
ENV VAULT_SKIP_VERIFY=true

EXPOSE 8200