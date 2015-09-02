Path = require 'flavored-path'

pathToRepoFile = Path.get "~/some/repository/directory/file"
module.exports = mocks =
  pathToRepoFile: pathToRepoFile

  repo:
    getPath: -> Path.join this.getWorkingDirectory, ".git"
    getWorkingDirectory: -> Path.get "~/some/repository"
    refreshStatus: -> undefined
    relativize: (path) -> "directory/file" if path is pathToRepoFile
    repo:
      submoduleForPath: (path) -> undefined

  currentPane:
    alive: true
    activate: -> undefined
    getItems: -> [
      getURI: -> pathToRepoFile
    ]

  textEditor:
    getPath: -> pathToRepoFile
    getURI: -> pathToRepoFile
    onDidDestroy: (@destroy) -> undefined

  workspace:
    getActivePane: ->
      {
        alive: true
        activate: -> undefined
      }
    getPanes: -> []
    open: -> { done: -> undefined }
