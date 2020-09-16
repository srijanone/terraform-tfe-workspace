resource "tfe_workspace" "this" {
  name                  = var.name
  organization          = var.organization
  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  operations            = var.operations
  queue_all_runs        = var.queue_all_runs
  ssh_key_id            = var.ssh_key_id
  terraform_version     = var.terraform_version
  trigger_prefixes      = var.trigger_prefixes
  working_directory     = var.working_directory


  dynamic "vcs_repo" {
    for_each = length(keys(var.vcs_repo)) == 0 ? [] : [var.vcs_repo]

    content {
      identifier         = vcs_repo.value["identifier"]
      branch             = lookup(vcs_repo.value, "branch", null)
      ingress_submodules = lookup(vcs_repo.value, "ingress_submodules", false)
      oauth_token_id     = var.oauth_token_id
    }
  }

}

############## Variables #########################
resource "tfe_variable" "environment" {
  for_each = lookup(var.variables, "environment", {})

  category  = "env"
  key       = each.key
  value     = each.value
  sensitive = false

  workspace_id = tfe_workspace.this.id
}

resource "tfe_variable" "environment_sensitive" {
  for_each = lookup(var.variables, "environment_sensitive", {})

  category  = "env"
  key       = each.key
  value     = each.value
  sensitive = true

  workspace_id = tfe_workspace.this.id
}


resource "tfe_variable" "terraform" {
  for_each = lookup(var.variables, "terraform", {})

  category  = "terraform"
  key       = each.key
  value     = each.value
  sensitive = false

  workspace_id = tfe_workspace.this.id
}

resource "tfe_variable" "terraform_sensitive" {
  for_each = lookup(var.variables, "terraform_sensitive", {})

  category  = "terraform"
  key       = each.key
  value     = each.value
  sensitive = true

  workspace_id = tfe_workspace.this.id
}
