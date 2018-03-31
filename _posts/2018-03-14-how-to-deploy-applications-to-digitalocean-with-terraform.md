---
title: How to deploy applications to DigitalOcean with Terraform
layout: post
excerpt: "Create super fast and easy repeatable way to deploy various applications and servers from scratch."
categories: articles
tags: [deployment, digitalocean, terraform]
image:
  feature: digitalocean-terraform.png
comments: true
---

*I like to use [DigitalOcean](https://m.do.co/c/fac05d89f2e5) because it is pretty simple and doesn't cost too much. It already has complete enough infrastructure things for small websites and even large services.*  
*DigitalOcean has clean user-friendly Control Panel UI to setup droplets, networks and so on. I used to configure the applications manualy, but there is a way to do it much faster and more reliable.*

> [Terraform](https://www.terraform.io) is a tool that allows to describe any kind of infrastructure as a simple text and deploy or update it with a single command. Let's see how it works.

## Getting Started

Every web application has at least two things: **domain** and **server**. So to run the simplest website you need to create a server (DigitalOcean calls it **droplets**) and attach a domain to server's IP address.

##### Droplet Definition 

You can create droplet by logging in DigitalOcean's Control Panel then push 'Create Droplet', fill droplet's name choose droplet type, region and size and finnaly submit it all.

Droplet definition with Terraform looks the next way:

```r
resource "digitalocean_droplet" "default" {
  # Droplet Name
  name = "lemp-server"

  # Droplet Type
  #  One-click application: wordpress, lemp  stack, etc.
  #    - or -
  #  Clean distribuion: ubuntu, cent os, etc.
  image = "lemp-16-04"

  # Droplet Region and Size
  region = "nyc1"
  size   = "512mb"
}
```

<small>* *[The list of all available droplet arguments.](https://www.terraform.io/docs/providers/do/r/droplet.html)*</small>

##### Domain Definition

The same things with adding domains. You can do it via DigitalOcean Control Panel or provide Terraform configuration:

```r
resource "digitalocean_domain" "default" {
  # Domain
  name = "example.com"

  # IP address of droplet to attach domain
  ip_address = "256.100.1.23"
}

# !!! WARNING:
# There are 'dummy' IP and domain name, do not try to use it.
```

#### Deploying

Begin with creating directory to store Terraform configuration files. Then create `service.tf` (the filename can be anything you want) file in this directory and put domain and droplet definitions into.

```r
resource "digitalocean_domain" "default" {
  name       = "example.com"
  ip_address = "${digitalocean_droplet.default.ipv4_address}"
}

resource "digitalocean_droplet" "default" {
  name   = "lemp-server"
  image  = "lemp-16-04"
  region = "nyc1"
  size   = "512mb"
}
```

Set `${digitalocean_droplet.default.ipv4_address}` variable as domain ip_address to map your domain to droplet and don't forget to set correct domain name, because DigitalOcean won't allow you to add already registered with DigitalOcean Networking domain.

*Terraform is smart enough to understand that domain can't be created without droplet's IP address, so first it creates droplet, and then it will be able to give correct ip_address for the domain.*

Almost done. The last thing to do is set provider credentials, so put next lines at the top of `serivce.tf` file:

```r
provider "digitalocean" {
  token = "7d50acd89ca3b...8cde9a059828b"
}
```

*You need to generate DititalOcean API token at the [API](https://cloud.digitalocean.com/settings/api/tokens) section of [DigitalOcean Control Panel](https://cloud.digitalocean.com)*

Now you have `service.tf` file like this one:

```r
provider "digitalocean" {
  token = "7d50acd89ca3...8cde9a059828b"
}

resource "digitalocean_domain" "default" {
  name       = "example.com"
  ip_address = "${digitalocean_droplet.default.ipv4_address}"
}

resource "digitalocean_droplet" "default" {
  name   = "lemp-server"
  image  = "lemp-16-04"
  region = "nyc1"
  size   = "512mb"
}
```

Initialize Terraform provider with `terraform init`. It downloads required provider files and initializes Terraform configuration directory (almost like `git init` command initializes repository in working directory).

You can see what this infrastructure definition will do by `terraform plan`. Terraform gives you the list of actions that will be performed on DigitalOcean. With current infrastructure definition you should see output like this:

```
$ terraform plan

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + digitalocean_domain.default
      id:                   <computed>
      ip_address:           "${digitalocean_droplet.default.ipv4_address}"
      name:                 "example.com"

  + digitalocean_droplet.default
      id:                   <computed>
      disk:                 <computed>
      image:                "lemp-16-04"
      ipv4_address:         <computed>
      ipv4_address_private: <computed>
      ipv6_address:         <computed>
      ipv6_address_private: <computed>
      locked:               <computed>
      name:                 "lemp-server"
      price_hourly:         <computed>
      price_monthly:        <computed>
      region:               "nyc1"
      resize_disk:          "true"
      size:                 "512mb"
      status:               <computed>
      vcpus:                <computed>


Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

$▐
```

Now if you try to `terraform apply` and approve actions you will get defined resources on your DigitalOcean account.

To destroy this infrastructure run `terraform destroy`.

*Don't be afraid to lost other droplets and services on your account by `terraform destroy`. Terraform stores defined and deployed resources in `terraform.tfstate` file, so it will only remove resources defined and deployed from this working directory.*

## Re-usable Configuration

At this moment configuration values are used directly in resource definitions. It is ok, but if you want to make really re-usable configuration you need to export values to variables.

##### Variable Definition

Terraform variables looks the next way:

```r
variable "variable_name" {
  type        = "string|list|map"
  default     = ""
  description = "A human-friendly description for the variable."
}
```
<small>* *Type, description and default variables are optional arguments.*</small>

#### Export Variables

Create `variables.tf` file and think about what arguments may be changed and what arguments should be changed in similiar deployments.

For example, **droplet size** and **image** can be the same for different projects, so you can provide default value for this arguments, but **domain name** can't be the same for different projects, so you just need to define that you're requiring this argument but it won't have default value.

```r
variable "do_token" {
  description = "DigitalOcean API Token"
}

variable "domain" {
  description = "Domain name the service should be located on"
}

variable "region" {
  description = "Datacenter region."
  default     = "nyc1"
}

variable "droplet_name" {
  description = "Droplet name in DigitalOcean Control Panel"
}

variable "droplet_image" {
  description = "Image distribution"
  default     = "lemp-16-04"
}

variable "droplet_size" {
  description = "Droplet size"
  default     = "512mb"
}
```

Now replace `service.tf` file values with new created variables:

```r
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_domain" "default" {
  name       = "${var.domain}"
  ip_address = "${digitalocean_droplet.default.ipv4_address}"
}

resource "digitalocean_droplet" "default" {
  name   = "${var.droplet_name}"
  image  = "${var.droplet_image}"
  region = "${var.region}"
  size   = "${var.droplet_size}"
}
```

Next you should provide values for variables when making `terraform apply`. Values can be passed by:
 * [Environment Variables](#environment-variables);
 * [Interactive Prompt](#interactive-prompt);
 * [Variable Files](#variables-files).

##### Environment Variables

You can provide values via environment. The name of the environment variable must be `TF_VAR_` followed by the `variable_name`, and the value is the value of the variable. 

For example, variables above can be set by:

```
$ TF_VAR_do_token=7d50acd89ca3...8cde9a059828b TF_VAR_domain=example.com TF_VAR_droplet_name=lemp_server terraform apply
```

or

```
$ export TF_VAR_do_token=7d50acd89ca3...8cde9a059828b TF_VAR_domain=example.com TF_VAR_droplet_name=lemp_server
$ terraform apply
```

##### Interactive Prompt

Alternatively you can provide values just by `terraform apply` and Terraform will ask for it (which does not have defaults) interactively:

```
$ terraform apply
var.do_token
  DigitalOcean API Token

  Enter a value:▐
```

##### Variable Files

And the last way to provide values is files which match `terraform.tfvars` or `*.auto.tfvars` in the configuration directory, Terraform automatically loads them to populate variables. For example:

```
do_token = "7d50acd89ca3...8cde9a059828b"
domain = "example.com"
droplet_name = "lemp_server"
```

## Conclusion

With this setup you can deploy a big number of services in a few minutes. Here is only example of the easiest and the smallest infrastructure, but with Terraform you can describe infrastructure of any complexity and size.

## References

* [DigitalOcean](https://m.do.co/c/fac05d89f2e5)
* [Terraform](https://www.terraform.io)
