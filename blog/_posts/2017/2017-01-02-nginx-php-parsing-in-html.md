---
title: Parsing In-line PHP With Nginx
layout: post
description: Enable in-line PHP parsing with Nginx; code snippets included.
robots: none
comments: true
published: true
---

### My Environment  
- Nginx version
	- 1.10.0
- PHP version
	- 7.0
- FastCGI processor
	- php7.0-fpm
- Kernel
	- Ubuntu 16.04

## The First And More Obvious Step

To enable parsing of PHP in HTML files, editing a server block's location block to include files with an HTML extension should be sufficient.  
For example:  

```
# /etc/nginx/sites-available/mywebsite.com
location ~ \.(php|html)$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
}
```  

However, since I am working with PHP 7, whose full name is "php7.0" (which is usefully descriptive but makes things tricky when initially looking for related directories or daemons), I had an extra step in order to make this work. And apparently, all PHP versions, from late php5.\* to php7.0, will require this extra step.

## The Final And Not-So-Obvious Step

You'll now have to edit `php-fpm.conf`, or preferrably one of its included files; namely, `www.conf`.  
For me, `php-fpm.conf` lives at `/etc/php/7.0/`, with `www.conf` in directory `pool.d`.  

The line we are looking for in `www.conf` (or the line you can add to `php-fpm.conf` if you want) is `security.limit_extensions`, which, in conjunction with our Nginx configuration, will permit our specified file types to be parsed as PHP. You may have to uncomment it, and for me it read as such by default:

`security.limit_extensions = .php .php3 .php4 .php5 .php7`

Here we can add `.html` or `.htm`, or even `.js` (but then we'd have to add `.js` to our Nginx location block as we did with `.html` earlier).  

Finally, we must now restart the php-fpm daemon, and of course, our Nginx server, for all changes to take effect.

For me, signaling Nginx to reload works:  
`nginx -s reload`  
(You will need root permissions for this.)  

For php-fpm, I use the service wrapper:  
`service php7.0-fpm restart`  
(Root permissions needed again.)

Now you should be all set to write in-line PHP in HTML files, or even JavaScript files, if your heart so desires.
