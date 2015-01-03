class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

  last: ->
    temp = @pop()
    @push(temp)
    # console.log @[@length - 1]
    console.log temp
    console.log JSON.stringify(@)
    temp.attributes
