# statistics and brackets

## inspiration

I was recently thinking about [brackets](https://en.wikipedia.org/wiki/Bracket_(tournament)) (to be more specific, [brackets for a single-elimation tournament](https://en.wikipedia.org/wiki/Single-elimination_tournament)) -- Specificly how to deterimine the likelihood that a specific team would win the championship before any games have started with only the knowledge one has at the start of a tournament (the first round of games) and a set of probabilities that each team would win against every other team.

### requirements
* nodejs

### installation
install dependencies with npm - 
`$ cd bracket_probability && npm install`

### API
CoffeeScript example
```coffeescript
A = require 'bracket-probability'
dist = { a: { b: .9 }, b: { a: .1 }}
A.get_probability_dist "ab", dist
```

### tests
`$ npm test`

### licensing
(GPLv3)[https://gnu.org/licenses/gpl.html]
