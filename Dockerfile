ARG VAULT_TAG=1.13.3

FROM vault:${VAULT_TAG} AS base

COPY ./config/vault.hcl /hc-vault/vault.hc

# Build the image for amd64 architecture
FROM base AS amd64
RUN echo "Building for amd64 architecture"
RUN uname -m
RUN vault version
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.version=${VAULT_TAG}
LABEL org.label-schema.description="Basic Vault image with sample configuration (amd64)"
COPY README.md /

# Build the image for arm64 architecture
FROM base AS arm64
ARG OPENSSL_VERSION
RUN echo "Building for arm64 architecture"
RUN uname -m
RUN vault version
LABEL org.label-schema.architecture="arm64"
LABEL org.label-schema.version=${VAULT_TAG}
LABEL org.label-schema.description="Basic Vault image with sample configuration (arm64)"
COPY README.md /

# Set multi-architecture labels
LABEL org.label-schema.architecture="multi-platform"
LABEL org.label-schema.version=${VAULT_TAG}
LABEL org.label-schema.description="Basic Vault image with sample configuration (multi-platform)"

# Create a manifest list to include both images
FROM scratch AS manifest
COPY --from=amd64 / /
COPY --from=arm64 / /
LABEL org.label-schema.architecture="multi-platform"
LABEL org.label-schema.version=${VAULT_TAG}
LABEL org.label-schema.description="Basic Vault image with sample configuration (multi-platform)"
CMD [ "cat", "/README.md" ]

# Use the manifest command to create a single image that can run on multiple architectures
FROM manifest AS final

ENV VAULT_ADDR=http://127.0.0.1:8200
ENV VAULT_API_ADDR=http://127.0.0.1:8200
ENV VAULT_SKIP_VERIFY=true

EXPOSE 8200

CMD [ "vault" ]