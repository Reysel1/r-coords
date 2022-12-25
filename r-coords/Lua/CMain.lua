local QBCore = exports["qb-core"]:GetCoreObject()

RegisterCommand('coords', function() 
    OpenUI()
end)


function OpenUI()
    SetNuiFocus(true, true)
    local _char = PlayerPedId()
    local _charPos = math.floor(GetEntityCoords(_char))
    local _charHeading = math.floor(GetEntityHeading(_char))
    SendNUIMessage({
        type = "open",
        _charPos = _charPos,
        _charHeading = _charHeading,
    })
end

RegisterNUICallback('int:close', function(data)
    SetNuiFocus(false, false)
end)
  

RegisterNUICallback('int:noty', function(data)
    QBCore.Functions.Notify(data.noti)
end)
  