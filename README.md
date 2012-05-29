motion-dtrace
=============

Proof of concept to use dtrace on rubymotion.

Demo
----

<iframe width="560" height="315" src="http://www.youtube.com/embed/w-5HySCUUkI" frameborder="0" allowfullscreen></iframe>

Installation
------------

```
gem install motion-dtrace
```

Usage
-----

1. Edit the Rakefile of your RubyMotion project and add the following require line.

```
require 'rubygems'
require 'motion-dtrace'
```

2. Start simulator process:

```
rake
```

3. On another terminal, start dtrace:

```
rake dtrace
```

You may specify your own dtrace file via: 

```
rake dtrace DTRACE=/Users/siuying/Documents/workspace/motion/motion-dtrace/dtrace/methods_duration.d
```

TODO
----

Currently this gem is just a hack to simplify command lines. 

We shall investigate can we do real integration with project.

Credit
------

- [MacRuby DTrace examples](https://github.com/MacRuby/MacRuby/tree/master/sample-macruby/DTrace)
- [Using the DTrace](http://watson1978.github.com/MacRuby-DoJo/blog/2012/04/15/dtrace/)