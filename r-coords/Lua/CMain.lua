local core = nil -- nil to use basic notifs, esx or qb if you use any frameworks


if (core == 'esx') then 
    ESX = exports['es_extended']:getSharedObject()
elseif ( core == 'qb' ) then 
    QBCore = exports["qb-core"]:GetCoreObject()
end

RegisterCommand('coords', function() 
    OpenUI()
end)

function OpenUI()
    SetNuiFocus(true, true)
    local _char = PlayerPedId()
    local _charPos = GetEntityCoords(_char)
    local _charHeading = GetEntityHeading(_char)
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
    if (core == 'esx') then 
        return ESX.ShowNotification(data.noti)
    end

    if (core == 'qb') then 
        return QBCore.Functions.Notify(data.noti)
    end

    if (core == nil) then 
        return SendNotification(data.noti)
    end
end)
  
SendNotification = function(msg)
    AddTextEntry('someNotification', msg)
    BeginTextCommandDisplayHelp('someNotification')
    EndTextCommandDisplayHelp(0, false, true, 3000)
end