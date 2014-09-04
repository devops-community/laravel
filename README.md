# Laravel

Build and deploy a simple setup for a [Laravel](http://laravel.com) app on [devo.ps](http://devo.ps).

## Install

Simply use the link below:

[![Fork on devo.ps](https://app.devo.ps/assets/images/fork.png)](https://app.devo.ps/#/fork?git_url=https://github.com/devops-community/laravel)

Once you've forked the repository, open it in devo.ps and you will be prompted for a few settings, including the Git URL for the code of your application.

To deploy your app, you will need to navigate to the tasks page of the repo and run the task manually (click on "play" icon, right of the "Build Laravel app" task).

## What's in the box?

This setup contains one server (`nodes/laravel.yml`) with **Nginx**, **PHP 5.5** (with php-fpm and composer) and **MySQL 5.5** (with a "laravel" user and a "larvel" database)

We have included as well a task (`tasks/build-laravel.yml`) that:

1. Clone your laravel app from GitHub (set to [scotch-io/laravel-angular-comment-app](https://github.com/scotch-io/laravel-angular-comment-app) by default).
1. Run a build script (`scripts/build-laravel.sh`) that will:
  1. Install laravel via composer, using the `composer.json` file if found,
  1. Write the configuration file (to connect it to MySQL),
  1. Migrate and seed the database with sample data.

The current repo provides a very simple setup. Hack at will!

## Questions?

If you have any question, come ask us on the [devo.ps chat](https://www.hipchat.com/gyHEHtsXZ) or shoot us an email at [help@devo.ps](mailto:help@devo.ps) (though, you should really just [ask us in the chat](https://www.hipchat.com/gyHEHtsXZ)).

# Reference

- [Laravel tutorial](http://scotch.io/tutorials/php/create-a-laravel-and-angular-single-page-comment-application) from [Chris Sevilleja](http://scotch.io/author/chris)
- [Nodes in devo.ps](http://docs.devo.ps/manual/nodes)
- [Tasks in devo.ps](http://docs.devo.ps/manual/tasks)
