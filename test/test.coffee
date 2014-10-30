should = require 'should'
analyzer = require '../index.coffee'

# test matrix
test_matrix =
  a:
    b: .1
    c: .2
    d: .3
  b:
    a: .9 
    c: .4
    d: .7
  c:
    a: .8
    b: .6
    d: .1
  d:
    a: .7
    b: .3
    c: .9

describe 'bracket probability', () ->
  it 'should return probability of 1 for brackets with only one team', () ->
    dist = analyzer.get_probability_dist 'a', test_matrix
    dist.a.should.equal 1
  it 'should return probability of 1 for brackets with only one team', () ->
    dist = analyzer.get_probability_dist 'b', test_matrix
    dist.b.should.equal 1
  it 'should return correct probability for a 2-team bracket', () ->
    dist = analyzer.get_probability_dist 'ab', test_matrix
    dist.a.should.equal 0.1
  it 'should return correct probability for a 2-team bracket, regardless of order given in team lineup', () ->
    dist = analyzer.get_probability_dist 'ba', test_matrix
    dist.a.should.equal 0.1
  it 'should return correct probability for a 4-team bracket', () ->
    dist = analyzer.get_probability_dist 'abcd', test_matrix
    # probability of first game + sum-of-products
    # doing the math here to get consistent rounding errors.  :)
    dist.a.should.equal (.1 * ( .2 * .1  + .3 * .9 )) 


    