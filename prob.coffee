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
champtionship_prob = (lineup, prob_matrix) ->
  # get probability A will beat B given probability_matrix                   
  prob = (A,B) -> return prob_matrix[A][B]

  # get probability distribution for a subsection of the lineup
  prob_dist = (left, right) -> {
    
  }
  

  # get opponent
  opponent = () -> if (lineup[0] == team_name) then lineup[1] else lineup[0]

  # probability is easy if we've only got one game
  if lineup.length == 2
    teamA = lineup[0]
    teamB = lineup[1]
    retval = {}
    retval[teamA] = prob(teamA, teamB)
    retval[teamB] = prob(teamB, teamA)
    return retval
  else
    console.log exports
    'TODO: sum of probabilities'

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
    
console.log champtionship_prob 'ab', prob_matrix
console.log champtionship_prob 'abcd', prob_matrix

