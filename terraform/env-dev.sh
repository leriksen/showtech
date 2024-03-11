export env=dev
export TF_VAR_env="${env}"

export ARM_USE_AZUREAD=true
export ARM_CLIENT_ID="a875ec61-0a8b-4137-bfb1-135dcacc0a7f"
export ARM_CLIENT_SECRET="$(cat .key_${env})"
export ARM_SUBSCRIPTION_ID="743b758a-f6e7-4823-b706-950a64a6c9f9"
export ARM_TENANT_ID="4e5dff48-af2c-4e7e-a5fa-bb6560ec04b6"
