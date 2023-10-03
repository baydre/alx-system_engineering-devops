#!/usr/bin/env ruby
# accepts one argument and pass it to regex match-method
puts ARGV[0].scan(/htb{2,5}n/).join
