# Keychain Generic Password

## local

> Generic executable by local template

<!-- markdownlint-disable MD036 -->

**OPTIONS**

- service
  - flags: -s --service
  - type: string
  - desc: service
- account
  - flags: -a --account
  - type: string
  - desc: account

<!-- markdownlint-enable MD036 -->

```bash
SERVICE="${service:-MyService}"
ACCOUNT="${account:-MyAccount}"
EXECUTABLE="${MASKFILE_DIR}/executable-output/KeyChain-Password-${SERVICE}-${ACCOUNT}"
echo "service = ${SERVICE}"
echo "account = ${ACCOUNT}"
cookiecutter \
    --verbose \
    --no-input \
    --debug-file "${MASKFILE_DIR}/debug-file/${SERVICE}-${ACCOUNT}.create.debug.txt" \
    --output-dir "${MASKFILE_DIR}"/swift-output \
    "${MASKFILE_DIR}" \
    service="${SERVICE}" \
    account="${ACCOUNT}"
swiftc -o "${EXECUTABLE}" -emit-executable "${MASKFILE_DIR}/swift-output/${SERVICE}-${ACCOUNT}/KeyChain-Password-${SERVICE}-${ACCOUNT}.swift"
sudo chown root "${EXECUTABLE}"
sudo chmod 744 "${EXECUTABLE}"
ls -l "${EXECUTABLE}"
```

## git

> Generic executable by git template

<!-- markdownlint-disable MD036 -->

**OPTIONS**

- service
  - flags: -s --service
  - type: string
  - desc: service
- account
  - flags: -a --account
  - type: string
  - desc: account

<!-- markdownlint-enable MD036 -->

```bash
SERVICE="${service:-MyService}"
ACCOUNT="${account:-MyAccount}"
EXECUTABLE="${MASKFILE_DIR}/executable-output/KeyChain-Password-${SERVICE}-${ACCOUNT}"
echo "service = ${SERVICE}"
echo "account = ${ACCOUNT}"
cookiecutter \
    --verbose \
    --no-input \
    --debug-file "${MASKFILE_DIR}/debug-file/${SERVICE}-${ACCOUNT}.create.debug.txt" \
    --output-dir "${MASKFILE_DIR}"/swift-output \
    https://github.com/huzhenghui/Keychain-Generic-Password \
    service="${SERVICE}" \
    account="${ACCOUNT}"
swiftc -o "${EXECUTABLE}" -emit-executable "${MASKFILE_DIR}/swift-output/${SERVICE}-${ACCOUNT}/KeyChain-Password-${SERVICE}-${ACCOUNT}.swift"
sudo chown root "${EXECUTABLE}"
sudo chmod 744 "${EXECUTABLE}"
ls -l "${EXECUTABLE}"
```

## get

> Get password by generated executable

<!-- markdownlint-disable MD036 -->

**OPTIONS**

- service
  - flags: -s --service
  - type: string
  - desc: service
- account
  - flags: -a --account
  - type: string
  - desc: account

<!-- markdownlint-enable MD036 -->

```bash
SERVICE="${service:-MyService}"
ACCOUNT="${account:-MyAccount}"
EXECUTABLE="${MASKFILE_DIR}/executable-output/KeyChain-Password-${SERVICE}-${ACCOUNT}"
fifo="$(mktemp).fifo"
mkfifo "${fifo}"
detach -- bash -c "sudo ${EXECUTABLE} > ${fifo}"
cat "${fifo}"
```

## generate-ghq-get-code

> Generate code for use in script

<!-- markdownlint-disable MD036 -->

**OPTIONS**

- service
  - flags: -s --service
  - type: string
  - desc: service
- account
  - flags: -a --account
  - type: string
  - desc: account

<!-- markdownlint-enable MD036 -->

```bash
SERVICE="${service:-MyService}"
ACCOUNT="${account:-MyAccount}"
echo mask --maskfile '"$(ghq list --full-path https://github.com/huzhenghui/Keychain-Generic-Password)/maskfile.md"' get --service "${SERVICE}" --account "${ACCOUNT}"
```
