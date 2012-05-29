motion-dtrace
=============

Proof of concept to use dtrace on rubymotion. Check the demo at [You Tube](https://github.com/siuying/motion-dtrace).

Installation
------------

```
gem install motion-dtrace
```

Usage
-----

Edit the Rakefile of your RubyMotion project and add the following require line.
```
require 'rubygems'
require 'motion-dtrace'
```

Start simulator process:
```
rake
```

On another terminal, start dtrace:
```
rake dtrace
```

When you terminate the app, you get a trace similar to following:

```
                         CLASS#METHOD                          TOTAL TIME µsec
--------------------------------------------------------------------------------
                       CGPoint#y=:                             3
                        String#nil?                            3
                         Array#last                            4
                        CGRect#origin                          4
                Evernote::Note#title                           4
                          Hash#empty?                          4
                          ........
                         Class#all:                            19867
                       UIImage#thumbnail                       24226
                  DTWebArchive#thumbnail                       24415
                      ClipItem#thumbnail                       24451
                    __NSArrayM#each                            24717
          ClipperTableViewCell#item=:                          25143
```

Extra
-----

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
