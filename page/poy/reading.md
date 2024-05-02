---
layout: default
title: Reading
parent: Paper of the Year
nav_order: 4
has_toc: false
permalink: /page/paper_of_the_year/reading.html
---

# {{page.title}}
{: .no_toc }

Reading is an important part of graduate school. Below are some tips and tools to make reading more convenient.
{: .fs-6 .fw-300 .text-justify}



## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


## MSU Proxy Bookmarklet
MSU offers [resources](https://libguides.lib.msu.edu/c.php?g=917727&p=6614013) to make remote journal access possible, but not neccessarily convenient. Below are instructions to create a [bookmarklet](https://en.wikipedia.org/wiki/Bookmarklet) that converts the current URL to the MSU proxy URL (access to campus web resources from anywhere). 
{: .text-justify }

Taking down barriers to reading scientific literature is important to me. If you try to use the tools below and run into problems, please let me know via email. I will strive to help you solve the issue and revise the instructions accordingly.
{: .text-justify }


### Desktop

Click and drag the link below into your bookmarks (tested Chrome & Safari on Mac)

[msuEZproxy](javascript:void(location.href='https://ezproxy.msu.edu/login?url=%27+location.href);)
{: .text-justify }

When you are away from campus, navigate to a journal article that is stuck behind a firewall. While you're still on the article's website, click the msuEZproxy bookmarklet. The bookmarklet will modify the URL of the current website. For example, using the bookmarklet at... 

https://onlinelibrary.wiley.com/doi/10.1002/anie.202402541
converts the URL to
https://onlinelibrary-wiley-com.proxy2.cl.msu.edu/doi/10.1002/anie.202402541

### Mobile

I have not found a way to simply drag [msuEZproxy](javascript:void(location.href='https://ezproxy.msu.edu/login?url=%27+location.href);) into my bookmarks in Chrome or Safari on iPhone. Depending on your setup, your desktop bookmarks may automatically sync to your browser on your phone. If that is the case, then you are all set.
{: .text-justify }

If your bookmarks do not sync to your phone automatically, you can add the bookmarklet manually following the instructions below.
{: .text-justify }

- navigate to any webpage (using google.com in this example)
- bookmark the webpage
- edit the bookmark (in Chrome on iphone this requires "..." icon > Bookmarks > Edit)
- edit the bookmark's name (here I'm naming it msuEZproxy, the name you choose doesn't impact function)
- edit the address of the bookmark to read `javascript:void(location.href='https://ezproxy.msu.edu/login?url=%27+location.href);`

*This is what the bookmark's "edit" page looks like before any changes.*

{% include image.html file="reading_bookmarklet_screenshot_before_edit.png" alt="alt" max-width=400 %}


*This is what it looks like after it has been edited to function as a bookmarklet.*

{% include image.html file="reading_bookmarklet_screenshot_after_edit.png" alt="alt" max-width=400 %}


You've created a bookmarklet! You can test it on your phone in the same way described for desktop.


## Feedly
To Do

## Google Scholar
To Do


