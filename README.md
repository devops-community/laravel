# Laravel

Build and deploy a node with an app based on the [Laravel PHP framework](http://laravel.com)

# Repo details

## Node

The node is built-in with:

- __Nginx__; will act as the web frontend
- __PHP 5.5__; including php-fpm, composer
- __MySQL 5.5__; is the database, including:
    - a __laravel__ user (with random password)
    - a __laravel__ database (full access to laravel db user)

## Task

A build task is provided that will perform the following upon run:

- clone a [laravel app](https://github.com/scotch-io/laravel-angular-comment-app) from Chris Sevilleja
- run a build script that will install laravel, including the dependencies and the configuration

## Script

A simple bash script is provided to perform the basic build of the laravel app, including:

- install laravel via composer, using the `composer.json` file if found
- configure the database
- migrate and seed the database with sample data

This script is easily customizable to include more tuning and changes of configuration as per your app requirements.

# Install

To provision the node, you need to activate your repository at https://app.devo.ps/#/user/laravel/settings.

But before enabling the repository, you will need to perform some changes in the provided node and task definitions.

## Node

You will need to specify in the node definition:

- the provider details; `name`, `size` and `location` - you need to have the provider defined in your profile
- extra packages to install on the server
- extra configuration of the installed services

Refer to the [documentation](http://docs.devo.ps/manual/nodes) for more details about nodes.

## Task

You may want to adapt the task definition as per your requirements.

Refer to the [documentation](http://docs.devo.ps/manual/tasks) for more details about tasks.

# Customization

The current repo provides a simple app, it needs to be customized to run as per your requirements / code. You may consider the following:

- use your own github repository with your own application code
- update the build script to perform more setup (e.g. configuration file, api keys, etc.)
- update the task itself to define other variables / commands to run on build

# Reference

- [Laravel tutorial](http://scotch.io/tutorials/php/create-a-laravel-and-angular-single-page-comment-application) from [Chris Sevilleja](http://scotch.io/author/chris)
