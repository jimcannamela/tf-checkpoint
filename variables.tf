variable "bucket_name" {
  description = "Value of the Name tag for the S3 bucket"
  type        = string
  default     = "jimc-tf-bucket"
}

variable "bucket_tag" {
  description = "Value of the Tag.Name tag for the EC2 instance"
  type        = string
  default     = "Jim C TF Bucket"
}

variable "target_file_name" {
    description = "Target file name"
    type = string
    default = "g-hello.jar"
}

variable "source_file_name" {
    description = "Source file name"
    type = string
    default = "./build/libs/g-hello-0.0.1-SNAPSHOT.jar"
}