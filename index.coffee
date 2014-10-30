## console.log 'prob.js v0.0.1'

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
get_probability_dist = module.exports.get_probability_dist = (lineup, prob_matrix) ->
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
    lprob = get_probability_dist left, prob_matrix
    rprob = get_probability_dist right, prob_matrix

    return p = prob lprob, rprob, pfunc

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


