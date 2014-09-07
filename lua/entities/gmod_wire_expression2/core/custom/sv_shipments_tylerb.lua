------------------------------------------------------
--      _     _                            _        --
--     | |   (_)                          | |       --
--  ___| |__  _ _ __  _ __ ___   ___ _ __ | |_ ___  --
-- / __|  _ \| |  _ \|  _   _ \ / _ \  _ \| __/ __| --
-- \__ \ | | | | |_) | | | | | |  __/ | | | |_\__ \ --
-- |___/_| |_|_|  __/|_| |_| |_|\___|_| |_|\__|___/ --
--             | |                                  --
--             |_|                 by TylerB.       --
------------------------------------------------------

AddCSLuaFile("cl_shipments_tylerb.lua") -- pretty sure wire does it already but just to be safe...

local shipments = CustomShipments
local broken = 
	{
		amount		=	-1,
		price		=	-1,
		noship		=	false,
		entity		=	"invalid_shipment",
		model		=	"models/error.mdl",
		seperate	=	false,
		name		=	"Invalid Shipment",
	}

local function getTable(ent)
	if not IsValid(ent) then return broken end
	if ent:GetClass() != "spawned_shipment" then return broken end
	
	for k,v in ipairs(shipments) do
		if k == ent:Getcontents() then
			return v
		end
	end
	
	return broken
end

local function getCount(ent)
	if not IsValid(ent) then return -1 end
	if ent:GetClass() != "spawned_shipment" then return -1 end
	
	return ent:Getcount()
end

e2function string entity:shipmentName()
	return getTable(this).name
end

e2function string entity:isShipment()
	if not IsValid(this) then return false end
	if this:GetClass() == "spawned_shipment" then return true end
	return false
end

e2function string entity:shipmentType()
	return getTable(this).entity
end

e2function normal entity:shipmentAmount()
	return getCount(this) -- it's a different function!
end

e2function string entity:shipmentModel()
	return getTable(this).model
end

e2function normal entity:shipmentPrice()
	return getTable(this).price
end

print("Loaded TylerB's shipment e2 functions.")