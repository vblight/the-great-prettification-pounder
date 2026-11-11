AddTextEntry('VILE_MULE', 'Mule')
AddTextEntry('VILE_MULE2', 'Mule')
AddTextEntry('VILE_POUNDER', 'Pounder')
local names = {"Belly-Up Seafood - refreshed", "Cluckin' Bell - refreshed", "US Postal - refreshed", "eCola - refreshed", "Go Postal - refreshed", "Truck You - refreshed", "Delivery Partners - refreshed", "SpandEx - refreshed", "Truck You Removals", "SpandEx Express", "Delivery Partners", "Darnell Bros", "Jetsam", "FlyUS Air Cargo", "Redwood", "EgoChaser", "Raine", "P's & Q's", "Los Santos Water & Power", "Paleto Forest Products", "HVY Industrial", "Dusche Gold", "Plain / paint-through"}
local function msg(t) print('[Pounder] '..t); TriggerEvent('chat:addMessage',{args={'Pounder',t}}) end
local function truck()
 local ped=PlayerPedId(); local v=GetVehiclePedIsIn(ped,false)
 if v==0 or GetEntityModel(v)~=joaat('pounder') or GetPedInVehicleSeat(v,-1)~=ped then msg('Use the driver seat of pounder.'); return nil end
 return v
end
RegisterCommand('pounderlivery',function(_,args)
 local v=truck(); if not v then return end; local n=tonumber(args[1])
 if not n or n~=math.floor(n) or n<1 or n>#names then msg('Use /pounderlivery 1 through 23. Plain: 23.'); return end
 if GetVehicleLiveryCount(v)<n then msg(('Livery unavailable: count=%d; definition=%s; mod48=%d.'):format(GetVehicleLiveryCount(v),GetDisplayNameFromVehicleModel(GetEntityModel(v)),GetNumVehicleMods(v,48))); return end
 SetVehicleLivery(v,n-1); msg(('Selected %d: %s'):format(n,names[n]))
end,false)
RegisterCommand('poundercheck',function() local v=truck(); if v then msg(('Version 1.2.0; definition=%s; liveries=%d; current=%d; mod48=%d.'):format(GetDisplayNameFromVehicleModel(GetEntityModel(v)),GetVehicleLiveryCount(v),GetVehicleLivery(v),GetNumVehicleMods(v,48))) end end,false)
