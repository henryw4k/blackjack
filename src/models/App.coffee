# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    console.log @get 'playerHand'
    console.log @get 'dealerHand'

    # show: ->
    #  (@get 'dealerHand').models[0].flip()

    # console.log 'hi'
    # (@get 'dealerHand').models[0].flip()
