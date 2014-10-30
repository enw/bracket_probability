console.log ''
console.log 'prob.js v0.0.1'

###
what's the probability that input team will win championship given bracket and
probabilities?

fxn takes
    # skip this for now, as it's not the most interesting part
    team of interest

    NOW
    initial leaf nodes of starting teams, left to right

    LATER
    current bracket (a binary tree) with leaf nodes of starting teams,
    '?'s for unplayed games

    win/loss probability matrix of teams

# was this...
#fxn returns probability team will win the championship
# now is this...
returns probably distribution for the championship

###
lineup_prob = (lineup, prob_matrix) ->
  #console.log "lineup_prob #{lineup}"
  # get opponent
  opponent = () -> if (lineup[0] == team_name) then lineup[1] else lineup[0]

  # function returns probability
  pfunc = (a,b) -> return prob_matrix[a][b];

  # probability is easy if we've only got one game
  # actually... bottom out at 1?
  if lineup.length == 1
    p={}
    p[lineup[0]]=1;
    return p
  else
    left = lineup[0...lineup.length/2]
    right = lineup[lineup.length/2..lineup.length]
    lprob = lineup_prob left, prob_matrix
    rprob = lineup_prob right, prob_matrix
    #console.log "inside lineup_prob #{left} #{right}", lprob, rprob

    return p = prob lprob, rprob, pfunc

prob_matrix =
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

# A - probability dist of teamname:probability
# B - probability dist of teamname:probability, distinct entries from A
# pfunc - function(A,B) that returns probability that A will win against B
prob = (A, B, pfunc) ->
  newprob = {}
  
  for teamname, specific_prob of A
#    console.log 'l', teamname, specific_prob
    accum = 0
    for opponent, opponent_prob of B
#      console.log 'r', opponent, opponent_prob, accum
      accum += opponent_prob * pfunc(teamname, opponent)
    newprob[teamname] = specific_prob * accum

  for teamname, specific_prob of B
#    console.log 'l', teamname, specific_prob
    accum = 0
    for opponent, opponent_prob of A
#      console.log 'r', opponent, opponent_prob, accum
      accum += opponent_prob * pfunc(teamname, opponent)
    newprob[teamname] = specific_prob * accum
    
  return newprob

pm = {
   a:{b:.1, c:1, d:.9}
   b:{a:.9, c:0, d:1}, 
   c:{a:1, b:1, d:.1},
   d:{a:.1, b:0, c:.9} 
}
pfunc = (a,b) -> return pm[a][b];

lprob = { a:.1, b:.9 }
rprob = { c:.2, d:.8 }

#console.log 'PROB', prob lprob, rprob, pfunc

lprob = { a:1 }
rprob = { b:1 }
#console.log 'PROB', prob lprob, rprob, pfunc

foo = { foo: 3 }
bar = { bar: 3 }
#console.log foo, bar, foo + bar

#console.log 'p', pfunc 'b', 'a'

# iterate through entries in a dictionary
#console.log key, value for key, value of { a:.1, b:.9 }

# iterate through items in a list
#console.log key, value for key, value in [ 1, 2, 3 ]

#console.log 'RESULTS', 'a', lineup_prob 'a', prob_matrix
#console.log 'RESULTS', 'b', lineup_prob 'b', prob_matrix
#console.log 'RESULTS', 'ab', lineup_prob 'ab', prob_matrix
#console.log 'RESULTS', 'ba', lineup_prob 'ba', prob_matrix
console.log 'RESULTS', 'abcd', lineup_prob 'abcd', prob_matrix
console.log 'RESULTS', 'cdab', lineup_prob 'cdab', prob_matrix
