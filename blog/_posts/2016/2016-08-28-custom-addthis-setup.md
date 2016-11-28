---
title: "Quick and Custom AddThis Setup"
layout: post
description: "Set up AddThis sharing with fully customized styles and capabilities to match your website's design and content needs."
robots: none
comments: true
---

Getting AddThis sharing set up exactly how I wanted took some digging the first time around. Maybe, like me, you wanted AddThis's functionality but with your own styles, and not the AddThis brand buttons. Here's how I set it up, allowing for full customization.

## Considerations

Before going further, here's a short list of things to consider before working with AddThis:

You should have included AddThis's script before your document's closing body tag.
AddThis's script will only work remotely; host locally or on a server.
AddThis links will not work when certain adblock browser extensions are enabled; I've found adblock plus gave me no problems, but ublock origin did.


## The Code And Setup

### The HTML:

```
<a class="sharing addthis_button_mailto">mailto</a>
<a class="sharing addthis_button_email">email</a>
<a class="sharing addthis_button_tumblr">tumblr</a>
<a class="sharing addthis_button_google">google</a>
<a class="sharing addthis_button_twitter">twitter</a>
<a class="sharing addthis_button_facebook">facebook</a>
<a class="sharing addthis_button_linkedin">linkedin</a>
```

For the HTML, we use anchors each with a class that the AddThis scripts and stylesheets recognize, such as "addthis_button_facebook". Sharing will be fully functional when clicking on an anchor with this class for the corresponding platform. Meaning, these classes are required, or at least in this setup.

The first class of "sharing" is a custom one that I use to denote that these anchors are for AddThis functionality, and to be styled as such. The JavaScript will point to the "sharing" class as well, but these are not required.

When you first create these anchors with the "addthis_button_socialplatform" class, AddThis will create a span as well that will contain a small image; I simply style that span with a "display: none", and carry on with my own styles.

### The JavaScript:

```
var share = document.getElementsByClassName('sharing');
for(var i=0; i<share.length; i++){
    share[i].setAttribute('addthis:url',document.URL);
    share[i].setAttribute('addthis:title',document.title);
    share[i].setAttribute('addthis:description','Check out my cool post!');
}
```

For the JavaScript, we simply set the attributes of our AddThis anchors (all with the class of "sharing") so that when sharing content, they automatically populate any text fields with the appropriate content. There's no need to set an href, as the AddThis script will automatically set it equal to #.

The AddThis anchor attributes are the following:

addthis:url - field will be populated with this url. In this case, I set it equal to our document's url, as I want the shared content to link back to my post or page. Of course, this url can be whatever you want.
addthis:title - The title that will appear before the description in your shared content.
addthis:description - this will be the copy that appears below the title in your shared content. This really only applies to platforms like Facebook and LinkedIn that allow for more copy when sharing. There won't be any bugs when this attributed is applied to an anchor where not applicable (such as twitter); the description simply will not appear in that platform's shared content, so there's no need to worry about that.
How you set any of these attributes is entirely up to you; I use JavaScript because I thought it was the easiest solution and I like JavaScript, but of course you could do it manually. Where you get your "addthis:description" is up to you as well; maybe an especially important paragraph's innerHTML?



### Considerations For Facebook And Email

Email (not mailto, but AddThis's email sharing) and Facebook sharing stand out amongst all the other platforms here in that they both require a little extra.

If you change the content you want to share to Facebook and it isn't updating, you'll want to paste the url of the page you're sharing into Facebook's sharing debugger.
While mailto will open your device's default mail client, then populate the subject based on the mailto attributes, "addthis_button_email" populates its fields based on the AddThis config variable (seen below).

```
var addthis_config = addthis_config||{};
addthis_config.ui_email_to = 'recipient@email.com';
addthis_config.ui_email_from = 'sender@email.com';
addthis_config.ui_email_note = 'The copy that makes up the body of the email.';
```

Only one of these will work per page. Also, in case you're familiar with the old AddThis email modal, I feel I should warn you that they've done away with that and instead AddThis email opens a new window.

Alternatively, you could create an email template in your AddThis dashboard. I'll admit AddThis has good documentation for this.

Finally, you may want to "display: none" on "#at-cv-lightbox"; this modal can popup after first visit to a page using AddThis.