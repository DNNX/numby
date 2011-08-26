# Description [![Build Status](https://secure.travis-ci.org/DNNX/numby.png)](http://travis-ci.org/#!/DNNX/numby)

Some number methods (each_divisor, digital_root, etc.)
The gem requires Ruby 1.9, because it uses [Prime](http://www.ruby-doc.org/core-1.9/classes/Prime.html).

# Installation

`gem install numby`

# Usage

    require 'numby'

    p 12.each_divisor.to_a
    #=> [1, 2, 3, 4, 6, 12]

    4.each_divisor do |d|
      puts d
    end
    #=> 1
    #=> 2
    #=> 4

    p 876.digital_root
    #=> 3

    p 0xFE.digital_root(16)
    #=> 14

# Testing

Remember that gem requires Ruby 1.9

    git clone git://github.com/DNNX/numby.git
    bundle install
    bundle exec rake


