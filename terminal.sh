#!/usr/bin/env bash

#
# This is probably the only CoffeeScript for OS X Automation script in the
# world.
#
# https://developer.apple.com/library/mac/releasenotes/InterapplicationCommunication/RN-JavaScriptForAutomation/
#
# Compile CoffeeScript to JS then pass to osascript
coffee -sp << EOF | osascript -l JavaScript
# The rest of this script is written in CoffeeScript

terminalSettings =
    titleDisplaysShellPath: false
    titleDisplaysDeviceName: false
    titleDisplaysCustomTitle: true
    titleDisplaysSettingsName: false
    titleDisplaysWindowSize: true
    name: 'Pro Subdued'
    customTitle: 'Terminal'
    numberOfColumns: 120
    numberOfRows: 24
    cleanCommands: ['screen', 'tmux']
    fontAntialiasing: true
    fontName: 'LiterationMonoPowerline'
    fontSize: 14
    normalTextColor:
        red: 0.7725337743759155
        green: 0.7843137383460999
        blue: 0.7764553427696228
    backgroundColor:
        red: 0.07438772916793823
        green: 0.0794079527258873
        blue: 0.08531319350004196
    boldTextColor:
        red: 1
        green: 1
        blue: 1
    cursorColor:
        red: 0.3024185597896576
        green: 0.3024185597896576
        blue: 0.3024185597896576

Terminal = Application 'Terminal'
defaultSettings = Terminal.defaultSettings()
originalSettings = defaultSettings.properties()
# return console.log JSON.stringify(originalSettings, null, '    ')

# Check whether an object is Array or not
# @type Boolean
# @param {object} subject is the variable that is
# tested for Array identity check
isArray = (->
    # Use compiler's own isArray when available
    if Array.isArray
        return Array.isArray

    # Retain references to variables for performance
    # optimization
    objectToStringFn = Object.prototype.toString
    arrayToStringResult = objectToStringFn.call []

    (subject) ->
        return objectToStringFn.call(subject) == arrayToStringResult
)()

console.log JSON.stringify originalSettings
cson = (subject, indent=1) ->
    if indent == 0
        indention = ''
    else
        indention = Array(indent).join '  '
    if isArray subject
        "\n#{indention}#{JSON.stringify(subject)}"
    else if typeof subject == 'object'
        ("\n#{indention}#{key}:#{cson subject[key], indent + 1}" for key in Object.keys(subject).sort()).join ''
    else
        " #{JSON.stringify(subject)}"

console.log cson originalSettings

return
cson = (obj) ->
    if isArray obj
        console.log "#{JSON.stringify(obj)}"
    else if typeof obj == 'object'
        console.log "obj #{obj}"
    else
        console.log "#{obj}"

return console.log cson terminalSettings

for key in Object.keys(terminalSettings).sort()
    newValue = terminalSettings[key]
    origValue = originalSettings[key]

    if isArray origValue
        console.log "# #{key}: #{JSON.stringify(origValue)}"
    else if typeof origValue == 'object'
        console.log "# #{key}:"
        console.log "#   #{subKey}: #{JSON.stringify(value)}" for subKey, value of origValue
    else
        console.log "* #{key}: #{JSON.stringify(origValue)}"

    # console.log "# #{key}: #{JSON.stringify(origValue)}"
    # if JSON.stringify(origValue) != JSON.stringify(newValue)
        # defaultSettings[key] = newValue
        # console.log "#{key}: #{JSON.stringify(newValue)}"

# End of CoffeeScript
EOF
