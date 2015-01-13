-- local is_dst
-- function IsDST()
--  if is_dst == nil then
--    is_dst = kleifileexists("scripts/networking.lua") and true or false
--  end
--  return is_dst
-- end

Inst = Class(function(self, inst)
  self.inst = inst
  end)

function Inst:combat()
  if IsDST() == false then
    return self.inst.components.combat
  else
    return self.inst.replica.combat
  end 
end

function Inst:combat_GetTarget()
  if IsDST() == false then
    return self.inst.components.combat.target
  else
    return self.inst.replica.combat:GetTarget()
  end 
end

function Inst:combat_GetAttackRangeWithWeapon()
  if IsDST() == false then
    return self.inst.components.combat:GetAttackRange()
  else
    return self.inst.replica.combat:GetAttackRangeWithWeapon()
  end 
end

function Inst:equippable()
  if IsDST() == false then
    return self.inst.components.equippable
  else
    return self.inst.replica.equippable
  end 
end
function Inst:equippable_EquipSlot()
  if IsDST() == false then 
    return self.inst.components.equippable.equipslot
  else
    return self.inst.replica.equippable:EquipSlot()  
  end 
end

function Inst:health_Max()
  if IsDST() == false then
    return self.inst.components.health.maxhealth
  else
    return self.inst.replica.health:Max()
  end 
end
function Inst:health_Current()
  if IsDST() == false then
    return self.inst.components.health.currenthealth
  else
    return self.inst.replica.health.classified.currenthealth:value()
  end 
end

function Inst:inventory_GetEquippedItem(slot)
  if IsDST() == false then 
    return self.inst.components.inventory:GetEquippedItem(slot)  
  else
    return self.inst.replica.inventory:GetEquippedItem(slot)  
  end 
end
function Inst:inventory_GetAllItems() 
  local items = {}
  for k,v in pairs(self:inventory_GetItems()) do table.insert(items, v) end 
  for k,v in pairs(self:inventory_GetEquips()) do table.insert(items, v) end  

  local overflow = self:inventory_GetOverflowContainer()
  if overflow ~= nil then  
    if overflow.slots then 
      for k,v in pairs(overflow.slots) do table.insert(items, v) end  
    else 
      for k,v in pairs(overflow:GetItems()) do table.insert(items, v) end  
    end  
  end
  return items 
end
function Inst:inventory_UseItemFromInvTile(item)
  if IsDST() == false then 
    return self.inst.components.inventory:UseItemFromInvTile(item)
  else
    return self.inst.replica.inventory:UseItemFromInvTile(item)  
  end 
end
function Inst:inventory_GetItems()
  if IsDST() == false then 
    return self.inst.components.inventory.itemslots
  else
    return self.inst.replica.inventory:GetItems()  
  end 
end
function Inst:inventory_GetEquips()
  if IsDST() == false then 
    return self.inst.components.inventory.equipslots 
  else
    return self.inst.replica.inventory:GetEquips()  
  end 
end
function Inst:inventory_GetOverflowContainer()
  if IsDST() == false then  
    local item = self.inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
    return item ~= nil and item.components.container or nil 
  else
    return self.inst.replica.inventory:GetOverflowContainer()  
  end 
end

function Inst:inventoryitem_PercentUsed()
  if IsDST() == false then 
    if self.inst.components.armor ~= nil then return self.inst.components.armor:GetPercent() end
    if self.inst.components.finiteuses ~= nil then return self.inst.components.finiteuses:GetPercent() end
    if self.inst.components.fueled ~= nil then return self.inst.components.fueled:GetPercent() end
    return 100  -- 사용횟수가 제한이 없다면 항상 100%
  else
    return self.inst.replica.inventoryitem.classified.percentused:value()
  end  
end


return Inst
