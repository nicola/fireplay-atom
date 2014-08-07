FireplayAtomView = require './fireplay-atom-view'

module.exports =
  fireplayAtomView: null

  activate: (state) ->
    @fireplayAtomView = new FireplayAtomView(state.fireplayAtomViewState)

  deactivate: ->
    @fireplayAtomView.destroy()

  serialize: ->
    fireplayAtomViewState: @fireplayAtomView.serialize()
