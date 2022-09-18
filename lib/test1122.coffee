Test1122View = require './test1122-view'
{CompositeDisposable} = require 'atom'

module.exports = Test1122 =
  test1122View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @test1122View = new Test1122View(state.test1122ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @test1122View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'test1122:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @test1122View.destroy()

  serialize: ->
    test1122ViewState: @test1122View.serialize()

  toggle: ->
    console.log 'Test1122 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
