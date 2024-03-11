provider "azurerm" {
  subscription_id            = "743b758a-f6e7-4823-b706-950a64a6c9f9"
  storage_use_azuread        = true
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

provider "azuread" {}
