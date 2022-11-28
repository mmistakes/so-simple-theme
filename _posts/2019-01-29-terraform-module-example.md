---
title: Terraform Module Example
layout: post
excerpt: "Alternative way to create re-usable and distributable application infrastructure with Terraform."
last_modified_at: 2019-02-14 10:40:18
categories: notes
tags: [deployment, terraform, wordpress]
image:
  feature: terraform-modules.png
comments: true
---

> In addition to [the previous article](/notes/how-to-deploy-applications-to-digitalocean-with-terraform/) I would also like to write about [Terraform&nbsp;Modules](https://www.terraform.io/docs/modules/index.html) as a way to boilerplate common deployment tasks.

*Let's make a module to quickly deploy WordPress website with DigitalOcean provider.*

## Getting Started

Commonly Terraform module contains the next items: input variables, output variables and main service definition. There are three files from [previous article](/articles/how-to-deploy-applications-to-digitalocean-with-terraform/) `variables.tf`, `credentials.tf` and `service.tf`.

Create a directory for your future Terraform module `wordpress/` and let's start with files of service definition. Rename `service.tf` to `main.tf`.

{% gist 7ccc2d5272d6ae4ec1736f1af86fe70a %}
<small>* since droplet `name` is required argument, use `"${coalesce(var.droplet_name, var.domain)}"`. It&nbsp;returns the first non-empty value from provided arguments, so you are able to give custom droplet name, otherwise it will be the same as a domain name.</small>

Next create `provider.tf` with provider definition:

{% gist 9cabff24807001150ca0863ab36158ba %}
<small>* we skip token argument and will provide it via environment variable</small>

At this moment there are complete service and provider definitions. But no module outputs and no input variables are defined, so do it.

{% gist 277da253ab62fd48d3d3b060897e12fc %}



#### DigitalOcean WordPress specific setup

*DigitalOcean's WordPress One-Click application requires few manual steps to make website available for the public, such as providing ServerName for apache configuration.*

Usually you need to login with SSH to droplet and then it runs `/opt/digitalocean/wp_setup.sh` script to make required setup with interactive prompt, but we'll perform the setup with Terraform.

{% gist e9cec4ad8615187cbb40a4c71490dd62 %}

Let's take only things we need and put it into `user_data.sh` file to apply it as [user_data](https://www.terraform.io/docs/providers/do/r/droplet.html#user_data) on droplet creation.

{% gist ec412367e4e02a0248635281b35fea7b %}

But there is no domain we want to set for the droplet. Also we can't easily pass Terraform variable into this script. Terraform has a solution for it called [template_file](https://www.terraform.io/docs/providers/template/d/file.html).

Rename `user_data.sh` to `user_data.tpl` and replace `$dom` bash variable with Terraform's `${domain}` variable on line 7.

{% gist 220d736c123d7d80391920aeb7847941 %}

Now, create one more file to describe this template `user_data.tf`.

{% gist f826b1f81f9fa47b2985e367517620be %}

The latest thing is to use created `template_file` as a droplet's user_data.

{% gist af83e278e447f9ea1b5e8519d6cef7ed %}

## Distribution

> I prefer use GitHub to store and distribute modules.

You need to create GitHub repository and just put all files into it. 

Check out [**the repo**](https://github.com/sergeykuzmich/tfmodule-do_wordpress) with this configuration.

There are few more ways to distribute modules. You can check it out on [HashiCorp Docs](https://www.terraform.io/docs/modules/sources.html).

## Usage

Create directory for your project and create `service.tf` file inside.

{% gist c370c470301064480c023c2f1e37e380 %}

That's it! You just need to provide valid credentials to perform this action.

#### Credentials

I use the next way to provide credentials for terraform:

1. the file with actual credentials as a environment varialbes (somewhere in user's home directory):
    `export DIGITALOCEAN_TOKEN=8d50ac...059828b`
2. .env file in terraform configuration directory to wrap environment variables into Terraform way:
    `export TF_VAR_token=$DIGITALOCEAN_TOKEN`

DigitalOcean provider requires `token` arugment as a access_key, so I wrap `$DIGITALOCEAN_TOKEN` into `$TF_VAR_token=$DIGITALOCEAN_TOKEN`.

Now, to apply any changes I just `source ~/do_credentials` file (the first one) and run Terraform commands.

## References

* [Terraform Module - DigitalOcean One-Click WordPress Application](https://github.com/sergeykuzmich/tfmodule-do_wordpress)
* [Terraform Modules](https://www.terraform.io/docs/modules/index.html)
* [Terraform Environment Variables](https://www.terraform.io/docs/configuration/environment-variables.html#tf_var_name)
* [Terraform Interpolation Syntax](https://www.terraform.io/docs/configuration/interpolation.html)
