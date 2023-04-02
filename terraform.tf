provider "github"{
    token = "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"
}


resource "github_repository" "first_repo_from_terraform"{
    name        = "first_repo_from_terraform"
    description = "This is my first resoucre creation of github from terraform i.e. creating a repository"
    visibility  = "public"
    auto_init   = true
}

