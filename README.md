motion-dtrace
=============

Proof of concept to use dtrace on rubymotion.

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


