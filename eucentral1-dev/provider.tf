provider "yelpaws" {
    region = "${var.region}"
    account = "${var.account}"
    credentials_file_profile = "${var.account}"
    credentials_provider = "file"
    security_token = ""
    secret_key = ""
    access_key = ""
    credentials_file_path = ""
}

provider "aws" {
    region = "${var.region}"
    credentials_file_profile = "${var.account}"
    credentials_provider = "file"
    security_token = ""
    secret_key = ""
    access_key = ""
    credentials_file_path = ""
}

