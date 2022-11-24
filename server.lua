local hook = 'YOUR_WEBHOOK'

RegisterServerEvent('beansaimlogs:log')
AddEventHandler('beansaimlogs:log', function(pedId)
    local _source = source
    local name = GetPlayerName(_source)
    local targetName = GetPlayerName(pedId)
    PerformHttpRequest(hook, function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Aim Logs**__",description="\nSpieler: "..name.. "`[".._source.."]`\nZielt auf: "..targetName.." `["..pedId.."]`",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)
