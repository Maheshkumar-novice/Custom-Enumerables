#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts 'each vs my_each'
numbers = [1, 2, 3, 4, 5]
numbers.each { |item| puts "From Enumerable#each => #{item}" }
numbers.my_each { |item| puts "From Enumerable#my_each => #{item}" }
