-- Beginner Code for Ficsit Networks mod on Satisfactory
-- 2022 Kerry Emerson
-- Adapted from example code (with thanks to @Panakotta00)
-- Next update will provide example for Buildings with multiple inputs (like Manufacturer etc) and multiple outputs

-- Custom Rounding function with provision for decimal places
function round(value, precision)
   if (precision) then
   else
      precision = 0
   end

   magnitude = 1
   for i = 1, precision do
      magnitude = magnitude * 10
   end

   value = value * magnitude
   local f = math.floor(value)
      
   if (precision > 0) then
      return math.floor(value) / magnitude
   else
      return math.floor(value)
   end
end

-- Name of the machine you wish to connect to
Name = "Constructor"
Machine = component.proxy(component.findComponent(Name)[1])

-- Or use the UUID if preferred
-- Machine = component.proxy("AABBCCDDEEFF112233445566778899")

Progress    = Machine.progress
Consumption = Machine.powerConsumProducing
Efficiency  = Machine.productivity
CycleTime   = Machine.cycletime
MaxPoten    = Machine.maxPotential
MinPoten    = Machine.minPotential
Standby     = Machine.standby
Potential   = Machine.potential
RawRecipe   = Machine:getRecipe()
Rname       = RawRecipe.name -- Gets the name of the Recipe being used
if (Standby == true) then
   Status   = "Standby"
else
   Status   = "Running"
end
 
InventoryIn = Machine:getInputInv()
InventoryOut= Machine:getOutputInv()

InputCon = InventoryIn.itemCount
InventoryStackIn = InventoryIn:getStack(0)
InventoryItemIn = InventoryStackIn.item.type.name

OutputCon= InventoryOut.itemCount
InventoryStackOut = InventoryOut:getStack(0)
InventoryItemOut = InventoryStackOut.item.type.name

Progress = Progress *100/1
Efficiency   = Efficiency *100/1+1

print("Recipe Used       : "..Rname)
print("Status            : "..Status)
print("Progress          : "..round(Progress,2))
print("Power Consumption : "..round(Consumption,2).." Mw")
print("Production        : "..round(Efficiency))
print("Cycle Time        : "..round(CycleTime,1).." seconds")
print("Potential         : "..round(Potential*100).."%")
print("Input             : "..InventoryItemIn.." ("..InputCon..")")
print("Output            : "..InventoryItemOut.." ("..OutputCon..")")
