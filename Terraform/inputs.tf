variable "region" {
  type           =      string
  
}

variable "vpc_range" {
  type           =       string
  }
variable "subnet_cidrs" {
   type          =  list(string)
   
}
variable  "subnet_azs" {
    type         =  list(string)

}
variable "subnet_name_tags" {
  type =  list(string)
}

