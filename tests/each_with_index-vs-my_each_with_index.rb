#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts 'each_with_index vs my_each_with_index'
numbers = [1, 2, 3, 4, 5]
numbers.each_with_index { |item, index| puts "From Enumerable#each => #{index}:#{item}" }
numbers.my_each_with_index { |item, index| puts "From Enumerable#my_each => #{index}:#{item}" }
