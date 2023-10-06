#!/usr/bin/env ruby
puts ARGV[].scan(/\[(?:from|to|flags):(.*?)\]/).join(',')
