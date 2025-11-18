#!/usr/bin/env -S nu --no-history
let vault_item = op item ls --vault Beam --categories Login --format=json
    | from json
    | where title == 'john.jones@beambenefits.com (BEAM)'
    | first

let userpass = op item get $vault_item.id --fields=username,password | split row ,
let username = $userpass.0
let password = $userpass.1
let otp = op item get $vault_item.id --otp | str trim


^$"($env.HOME)/.beam-cli/beam-cli/bin/beam-cli" login --force --username $userpass.0 --password $userpass.1 --mfa-token $otp