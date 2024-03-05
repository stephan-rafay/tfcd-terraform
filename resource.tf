resource "rafay_workload_cd_operator" "operator-demo" {
  metadata {
    name    = "operator-demo"
    project = "benny"
  }
  spec {
    repo_local_path = "/tmp/application-repo"
    repo_url        = "https://github.com/stephan-rafay/test-tfcd.git"
    repo_branch     = "main"
    #credentials {
    #  username = var.git_user
    #  token = var.git_token
    #}

    path_match_pattern = "/:project/:namespace/:workload"
    base_path = "common"
    //cluster_names = "bb6"
    placement_labels = {
      "owner" = "myteam"
    }

    include_base_value = true
    #delete_action = "delete"

  }
  always_run = "${timestamp()}"
}
