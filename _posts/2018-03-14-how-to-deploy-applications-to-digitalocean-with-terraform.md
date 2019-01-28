---
title: How to deploy applications to DigitalOcean with Terraform
layout: post
excerpt: "Create super fast and easy repeatable way to deploy various applications and servers from scratch."
last_modified_at: 2019-01-28 23:00:13
categories: articles
tags: [deployment, digitalocean, terraform]
image:
  feature: digitalocean-terraform.png
comments: true
---

> I like [DigitalOcean](https://m.do.co/c/fac05d89f2e5) as a cloud servers provider because it is pretty simple and doesn't cost too much. It already has complete enough infrastructure things for small websites and large services.  

*DigitalOcean has clean user-friendly Control Panel UI to manage droplets, networks and so on. I used to configure applications manualy, but there is a way to do it much faster and more reliable.*

*[Terraform](https://www.terraform.io) is a tool which allows to define any kind of infrastructure as a simple text document and deploy or update it with a single command.*

## Getting Started

Every single web application has at least two things: **domain** and **server**. It means if you need to run the simplest website you need to create a server (DigitalOcean calls it **droplets**) and map a domain to server's IP address.

##### Droplet Definition 

You can create droplet with DigitalOcean Control Panel with 'Create Droplet' button, filling droplet's name, choosing droplet type, region and size.

Droplet definition with Terraform looks the next way:

{% gist 20319e9997fd7a7394d2a6702e047b98 %}

<small>* *[The list of all available droplet arguments.](https://www.terraform.io/docs/providers/do/r/droplet.html)*</small>

##### Domain Definition

The same things with adding domains. You can do it via DigitalOcean Control Panel or provide Terraform configuration:

{% gist b3d1284ad178afb797005f7cd1d6353b %}

#### Deployment

Begin with creating directory to store Terraform configuration files. Then create `service.tf` (the filename can be anything you want) file in this directory and put domain and droplet definitions into.

{% gist 5888fa06e5b8fc8afab15e44c95c13e1 %}

Domain `ip_address` uses reference to defined droplet as a value to authomatically map droplet to domain.

*Terraform is smart enough to understand that domain can't be created without droplet's IP address, so first it will create a droplet, and then it will give correct ip_address for the domain value.*

Almost done. The last thing to do is to set provider credentials, so create `credentials.tf` file in the same directory and put next lines into:

{% gist 874254f5ff8616f7dd7679b443012b79 %}

*You need to generate DititalOcean API token at the [API](https://cloud.digitalocean.com/settings/api/tokens) section of [DigitalOcean Control Panel](https://cloud.digitalocean.com)*

##### Here we go...

Initialize Terraform provider with `terraform init`. It downloads required provider files and initializes Terraform configuration directory (almost like `git init` command initializes repository in working directory).

Run `terraform plan`, it gives you the list of actions that Terraform will performe on DigitalOcean. With current infrastructure definition you should see output like this:

{% gist cf6df72392df8c08ff253299c5a89a5f %}

It's time to `terraform apply`. Confirm actions and you'll get defined resources on your DigitalOcean account. Check it out on Control Panel.

##### Roll-back

To destroy this infrastructure just run `terraform destroy`.

*Don't be afraid to lose other droplets and services on your account by `terraform destroy`. Terraform stores defined and deployed resources in `terraform.tfstate` file, so it will only remove resources defined and deployed from this working directory.*

## Re-usable Configuration

At this moment dynamic values (such as domain name, droplet type and size) are directly used in resource definitions. It is ok, but if you want to make re-usable configuration you need to export values to variables.

##### Variable Definition

Terraform variable looks the next way:

{% gist 69ffccc242f72095ba666debf2aebfd8 %}
<small>* *Type, description and default variables are optional arguments.*</small>

#### Export Variables

Create `variables.tf` file and think about which arguments **may be changed** and which arguments **should be changed** in similiar deployments (applications).

For example, **droplet size** and **image** can be the same for different projects, so you can provide default value for this arguments, but **domain name** can't be the same for different projects, so you just need to define that you're requiring this argument but it won't have default value.

{% gist 362b58ae2a867cfc17da945bb0d90d0e %}

Now replace `credentials.tf` and `service.tf` files values with new created variables:

{% gist eb6e078567dbc6e361e0a8e856edfbda %}

Next you should provide values for variables when making `terraform apply`. Values can be passed by:
 * [Environment Variables](#environment-variables);
 * [Interactive Prompt](#interactive-prompt);
 * [Variable Files](#variables-files).

##### Environment Variables

You can provide values via environment. The name of the environment variable must start with `TF_VAR_` followed by the `variable_name`, and the value is the value of the variable. 

For example, variables above can be set by:

{% gist ac4e2036d4673d04001b2cbb57887d60 %}

or

{% gist de6ebcfbbba9eec6fc085c3306b9ddcd %}

##### Interactive Prompt

Alternatively you can provide values just by `terraform apply` and Terraform will ask for it (which does not have defaults) interactively:

{% gist d1227a4a9921d06f5b94b729af95ba53 %}

##### Variable Files

And the last way to provide values is files which match `terraform.tfvars` or `*.auto.tfvars` in the configuration directory, Terraform automatically loads them to populate variables. For example:

{% gist 9de54d34d73627614a5d3395eb79d2ba %}

## Conclusion

With this setup you can deploy a big number of services in a few minutes. Here is only example of the easiest and the smallest infrastructure, but with Terraform you can describe infrastructure of any complexity and size.

## References

* [DigitalOcean](https://m.do.co/c/fac05d89f2e5)
* [Terraform](https://www.terraform.io)
