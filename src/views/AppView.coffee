class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  stand: ->
    @model.get('dealerHand').models[0].flip()

    # alert @model.get(minScore())
    # alert @model.get('playerHand').minScore()
    # alert @model.get('dealerHand').minScore()
    @model.get('dealerHand').hit()  while @model.get('dealerHand').minScore() <= 17


    # if dealer hand is < 17, dealer hits.
    # recurse until it goes over 17 or bust.
    # if dealer is over 17, dealer stand()
