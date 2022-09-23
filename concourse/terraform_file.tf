
provider "aws" {
  region = "us-east-1"
}


resource "aws_glue_job" "example_job" {
  name              = "terraform_test3_pipeline_job"
  role_arn          = "arn:aws:iam::298841451579:role/AWSPractice-Developer"
  worker_type         = "G.1X"
  number_of_workers = var.no_of_workers
  glue_version = "3.0"

  command {
    name            = "glueetl"
    python_version  = var.python_version
    script_location = "s3://ateststack-mycdkrallybucket34563723813c-9yh1y22c9zhe/test_job.py"
  }
  default_arguments = {
    # ... potentially other arguments ...
    #"--continuous-log-logGroup"          = aws_cloudwatch_log_group.example.name
    #"--enable-continuous-cloudwatch-log" = "true"
    #"--enable-continuous-log-filter"     = "true"
  }
}


variable "python_version" {
  default     = "3"
  description = "Python_version"
}

variable "no_of_workers" {
  default     = "2"
  description = "no_of_workers"
}
