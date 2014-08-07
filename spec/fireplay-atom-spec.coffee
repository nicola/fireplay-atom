{WorkspaceView} = require 'atom'
FireplayAtom = require '../lib/fireplay-atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "FireplayAtom", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('fireplay-atom')

  describe "when the fireplay-atom:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.fireplay-atom')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'fireplay-atom:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.fireplay-atom')).toExist()
        atom.workspaceView.trigger 'fireplay-atom:toggle'
        expect(atom.workspaceView.find('.fireplay-atom')).not.toExist()
