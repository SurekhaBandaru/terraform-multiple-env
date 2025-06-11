    bucket = "84s-tf-remote-state-prod"
    key = "tfvars-demo" 
    region = "us-east-1"
    #dynamodb_table = "84s-tf-remote-state" # as we enabled native s3 locking, we dont need this, this is deprecated
    encrypt = true #if anybody opens file, it will be encrypted
    use_lockfile = true