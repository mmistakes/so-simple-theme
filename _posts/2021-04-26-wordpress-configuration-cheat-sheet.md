---
layout: post
title: WordPress Configuration Cheatsheet
excerpt: "Short configuration checklist for the WordPress application."
last_modified_at: 2021-04-26 22:11:36
categories: notes
tags: [wordpress, https, security, configuration]
image:
  feature: wordpress.png
comments: true
---

> Original post was located by https://blog.ripstech.com/2018/wordpress-configuration-cheat-sheet/ url.

WordPress is the most frequently installed web application in the world. The system is operated not only by experienced developers but also by beginners. This post summarizes what to look out for when configuring your WordPress installation’s security.

## 1. Disable Debugging

The debug functionality should not be active in a production environment, as it might provide useful information to potential attackers.

The debug information is very helpful during the development of a WordPress application. However, it is important to make sure that the parameter is set back to false before loading the system onto a remote server. Errors should be logged, but they must not be visible to unauthorized users.

```php
define( 'WP_DEBUG', false );
#if WP_DEBUG_LOG is enabled, you have to enable WP_DEBUG as well
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
```

## 2. Use Strong Database Credentials

Each WordPress installation should have its own database with a dedicated user, and a secure and unique password.

When installing WordPress, a table prefix can be specified. This can allow you to run several installations using one database. However, sharing one database between different installations is dangerous because if one instance gets hijacked, the other installations will also be at risk. In addition, you should avoid using the database root account, as it has full access to all databases on the server.

```php
define( 'DB_NAME', 'unique_database_name' );
define( 'DB_USER', 'unique_database_user' );
define( 'DB_PASSWORD', 'strong_and_unique_password' );
```

## 3. Use Unique Keys and Salts

The salts and keys must be unique for each WordPress installation, as this is the only way to ensure secure user management.

The salts and keys are important for different functionalities in a WordPress application. Among other things for a secure login and a session management. The values are automatically chosen randomly during the installation. However, a WordPress installation might be duplicated. On deployment, it is advised to generate new values for these constants. These values can be retrieved via the following API. https://api.wordpress.org/secret-key/1.1/salt/

```php
#These values are intentionally left blank to avoid copy-pastes
define( 'AUTH_KEY',         '');
define( 'SECURE_AUTH_KEY',  '');
define( 'LOGGED_IN_KEY',    '');
define( 'NONCE_KEY',        '');
define( 'AUTH_SALT',        '');
define( 'SECURE_AUTH_SALT', '');
define( 'LOGGED_IN_SALT',   '');
define( 'NONCE_SALT',       '');
```

## 4. Use SSL Encryption

No one should be able to read the traffic between you server and your users. Use SSL encryption and force WordPress to use only this type of connection.

It is now standard practice to encrypt your traffic. Many browser manufacturers mark un-encrypted connections as dangerous. Often web hosters offer their customers simple free certificates to enable SSL encryption. Also providers like Let’s Encrypt offer free certificates.

```php
define('WP_SITEURL', 'https://www.mydomain.com');
define('WP_HOME', 'https://www.mydomain.com');

define( 'FORCE_SSL_ADMIN', true );
define( 'FORCE_SSL_LOGIN',true );
```

## 5. Prohibit Database Repair

WordPress supports automatic database repair. This should not be possible without a backup of the database.

The path `wp-admin/maint/repair.php`, which anyone with sufficient permissions can call, triggers this automatic process. This might be helpful for a broken or fragmented database schema. This should never be done without a proper backup of the database.

```php
define ( 'WP_ALLOW_REPAIR', false );
```

## 6. Disallow Unfiltered Content

Admins and Editors are able to publish unfiltered HTML or files. If that is not absolutely necessary, activate these filters.

By default, Admins and Editors are able to write unfiltered HTML in post title, post content, and comments. The filetype filter can also be deactivated. This filter should remain activated.

```php
define( 'DISALLOW_UNFILTERED_HTML', true );
define( 'ALLOW_UNFILTERED_UPLOADS', false );
```

## 7. Enable Auto Security Update

Your WordPress should always be up to date so that it can resist the latest attacks. Activate the automatic security updates.

Since WordPress is a wide-spread application, many attackers test for known vulnerabilities in outdated installations. Don’t forget to perform a backup before each core upgrade, so only the minor update with current security patches should be installed automatically.

```php
define( 'AUTOMATIC_UPDATER_DISABLED', false );
define( 'WP_AUTO_UPDATE_CORE', 'minor' );
```

## 8. Block External Request

Access from your installation to external resources should be restricted. It is advisable to only accept trusted sources.

Not only the external access to WordPress should be secured, but also the access from the system to external resources. Here, the principle of white-list instead of blacklist applies.

```php
define( 'WP_HTTP_BLOCK_EXTERNAL', true );
define( 'WP_ACCESSIBLE_HOSTS', 'api.wordpress.org, *.github.com, www.trusteddomain.com' );
```

## 9. Disallow File Modifications

Prohibit the editing of code lines in plugins and themes by your admins and editors. Deactivate the file editor for all extensions.

By manipulating code, a trusted extension can become a gateway for attackers.

```php
define( 'DISALLOW_FILE_EDIT', true );
```

## 10. Disallow Install Extensions

To harden your installation completely you can prevent any changes to your system by prohibiting the installation of plugins and themes.

Themes and plugins can not only bring advantages for your WordPress. You must trust the creators of these extensions. Activate this barrier to prevent your admins and editors from loading untrusted extensions.

```php
define( 'DISALLOW_FILE_MODS', true );
```


The cheat sheet lists the 10 most important configurations. Many of these settings are set correctly by default when installing WordPress while others can be changed to harden your security. Note that not all of the suggested settings for a secure configuration might be suitable for your application, depending on its environment and development stage. With the help of static analysis tools, these and other settings can also be checked automatically.
