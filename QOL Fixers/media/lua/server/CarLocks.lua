
function addKey()

	local player = getPlayer();
	local car = player:getVehicle();
	local inv = player:getInventory();

	--look for vehicles nearby
	local container = player:getUseableVehicle();
	if not container then
		container = player:getNearVehicle();
	end

	--make the valhalla check dependent on the mod being installed!
	if not car and container and container:getScript():getName() == "isoContainer2" and Valhalla.VehicleClaims:playerCanEnterVehicle( player, container) then --not sitting in a car, but there is a container near by.
		inv:AddItem( container:createVehicleKey());
		return;
	end

	if not car then
		player:Say("Not in a vehicle...");
		inv:AddItem("Base.SheetMetal");
	else
		inv:AddItem(car:createVehicleKey());
	end
end

function unHotwire() -- looking into VehicleCommands unhotwire debug cheat

local player = getPlayer();
local car = player:getVehicle();

if not car then
	player:Say("Not in a vehicle...");
	else
		ISVehicleMechanics.onCheatHotwire(player, car, false, false) -- should work in multiplayer since sendClientCommand
	end
end
