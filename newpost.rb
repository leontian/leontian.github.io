#!/usr/bin/env ruby
 
unless ARGV[0]
  puts 'Usage: newpost "the post title"'
  exit(-1)
end
 
date_prefix = Time.now.strftime("%Y-%m-%d")
postname = ARGV[0].strip.downcase.gsub(/ /, '-')
post = "/Users/leon/git/leontian.github.io/_posts/#{date_prefix}-#{postname}.markdown"
 
header = <<-END
---
layout: post
title: "#{ARGV[0]}"
---

h1. {{ page.title }}

END
 
File.open(post, 'w') do |f|
  f << header
end
 
system("mate", "-a", post)
