#
# Use macOS native SSH agent with Keychain integration
#

# Load keys from macOS Keychain
ssh-add --apple-load-keychain 2>/dev/null

# If no keys are loaded, try to add default keys
if ! ssh-add -l &>/dev/null; then
  # Try common key names
  for key in id_rsa id_ed25519 id_ecdsa; do
    if [[ -f "$HOME/.ssh/$key" ]]; then
      ssh-add --apple-use-keychain "$HOME/.ssh/$key" 2>/dev/null
    fi
  done
fi