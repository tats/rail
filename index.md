---
layout: default
title: Rail -- Replace Agent-String Internal Library
---

What is Rail?
------------

RAIL is a elisp library, translates codenames with latin chars of
FLIM/SEMI/XEmacs/UTF-2000-Mule/Meadow to Japanese characters (On
irchat-pj, Japanize code name for "CTCP VERSION" return string).

It also provides a function compatible with genjis.el (a partof tm, that
converts mule-version to Japanese characters).

![wanderlust_with_or_without_rails](https://raw.github.com/uwabami/rail/gh-pages/images/wanderlust_with_or_without_rail.png)

Download
--------

### Stable: tar.gz is available:

* [rail-1.2.7.tar.gz](pkg/rail-1.2.7.tar.gz)

### HEAD: GitHub: [uwabami/rail](https://github.com/uwabami/rail/)

* [HEAD zip](https://github.com/uwabami/rail/zipball/master)
* [HEAD tarball](https://github.com/uwabami/rail/tarball/master)

install
-------

* require: emacsen (I always use Emacs24.2)

<pre>
  $ tar xvzf rail-(version).tar.gz
  $ cd rail-(version)
  $ make
  $ sudo make install
</pre>

or use [el-get recipe](https://github.com/uwabami/dot.emacs.d/blob/master/recipes/rail.rcp).

License
-------
GPL-2+

Bug report
----------

If you find bugs, comments, ...
Please report [github issues](https://github.com/uwabami/rail/issues).

Contact
-------

Current maintainer: [Youhei SASAKI(uwabami@gfd-dennou.org)](mailto:uwabami@gfd-dennou.org)
