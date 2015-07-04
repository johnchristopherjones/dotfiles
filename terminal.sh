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
    fontName: 'SourceCodePro-Regular'
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

for key, newValue of terminalSettings
    origValue = originalSettings[key]
    if JSON.stringify(origValue) != JSON.stringify(newValue)
        defaultSettings[key] = newValue
        console.log "Change #{JSON.stringify(key)}"
        console.log "   from #{JSON.stringify(origValue)}"
        console.log "   to #{JSON.stringify(newValue)}"

# End of CoffeeScript
EOF
