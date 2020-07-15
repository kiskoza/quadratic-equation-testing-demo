# frozen_string_literal: true

class QuadraticEquation # < ActiveRecord
  class NoRootsException < StandardError
  end

  attr_accessor :a
  attr_accessor :b
  attr_accessor :c

  def initialize(a: 0, b: 0, c: 0)
    @a, @b, @c = a, b, c
  end

  def valid?
    a != 0
  end

  def solve
    if a == 0
      [(0 - c) / b]
    elsif a == 0 && b == 0
      raise NoRootsException
    else
      det = b * b - 4 * a * c

      sqrt = Math.sqrt(det)
      [(0 - b - det) / (2 * a), (0 - b + det) / (2 * a)]
    end
  end
end
