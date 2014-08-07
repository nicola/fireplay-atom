{View} = require 'atom'

module.exports =
class FireplayAtomView extends View
  @content: ->
    @div class: 'fireplay-atom overlay from-top', =>
      @div "The FireplayAtom package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "fireplay-atom:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "FireplayAtomView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
