--[[
    ___							   _____
	|  |			| |	   | |	       	  /  _  \
	|  |			| |	   | |	     	 /  / \  \
	|  |			| |	   | |	    	/  /___\  \
	|  |			| |	   | |	       /  ______   \
	|  |   			| |	   | |	      /	 /	 \  \
	|  |			| |	   | |	     /	/	  \  \
	|  |			| |	   | |	    /  /	   \  \
	|  |_ _ _ _ _		\  \_ _ _ / / 	   /  /		    \  \
	|_ _ _ _ _ _ |	 	 \_ _ _ _ _/	  /__/		     \__\
	
	
]]--





------- /// Variables \\\ -------
local myString = "text" -- A value encased in '', "", or `` is considered text or a "String"
local myNumber = 1 -- A Integer/Number value, can be any numerical value, it can also be an equation, but it always must return a number
local boolValue = true -- A Bool (Boolean) is just a true or false value
local myArray = {"Dog","Cat","Fish"}
local myTable = {
	Name = "John",
	Age = 42,
	Race = "Murican"
}

print(myString) -- [[ Strings = Text ]]
print(myNumber) -- [[ Integers/Numbers = Always returns a single number. But myNumber can be set to an equation like: myNumber = 1+1]]
print(myArray) --[[  Arrays = Just Values (Auto Indexed)
{
 [1] = "Dog",
 [2] = "Cat",
 [3] = "Fish",
} 
]]

print(myTable) --[[ Tables = Variables + Values (Not Auto Indexed)
{
 Name = "John",
 Age = 42,
 Race = "Murican"
}
]]

------- /// Conditionals / Loops \\\ -------

if boolValue then -- If myTable has a value, if so then it returns true, and runs
	-- Code here
end

--- "return" will stop the current function or condition

if myTable["Age"] >= 18 then 
	print("Tax that man")
else 
	print("No taxes yet.")
end 


while true do -- Inf loop, only stops when the script stops running. 
	-- This runs when the code inbetween while ____ do returns a value that isn't nil/null or false
	break
end

--- "break" inside of a if statement, for loop, or while loop will stop it. Return won't work for the while loop

-- The for loop has multiple parts,

--[[
for (variable = starting value), (end value) do
	-- code
end
]]
	

-- Example: 

for Num = 0, 10 do --< Runs until Number = 10
	-- Each time this runs, Num's value is upped by 1, until it reaches 10
end

for timez,var in ipairs(myTable) do -- Loops through a table, until it gets to the last entry
	
end

for timez,var in pairs(myArray) do  -- Loops through an array, until it gets to the last entry
	
end

------- /// Functions \\\ -------
--[[ 
 

_________ PARTS OF A FUNCTION _________

   { 
  	 1: Function  	
   	 2: Func Name    
  	 3: Paramaters (Inside the () there can be paramaters, or predefined variables),
   	 4: end,
   }

	There is 1 Function type, however you can write it 3 ways
--]]

-- [1]: a Global "Function" (Can be called from anywhere below it in the script) Ex:


function myGlobalFunction(isThisAFunction)  -- Can be empty
	-- Code here
	print(isThisAFunction) -- returns true
	
end

myGlobalFunction(true) -- This fires the function, can be written anywhere below the function.


-- [2]: a Local "Function" (Can be called from anywhere below it, if it's in the same function) Ex:

function holderFunction() 

	local function myLocalFunction()
		
	end
	
	myLocalFunction()
end
-- myLocalFunction CANNOT BE CALLED outside of the function it originates in.
holderFunction() -- This function is global
--[[

  [3]: Connect "Function" (It requires a event to be connected to it.)

	Parts of Connect "Function": 
	{
	  1: Variable (Must be somesort of an Instance, or Service)
	  2: Event, a event is modeled by the ⚡ emoji on the drop down menu.
	  3: :Connect()
	  4: Function + Params (This function cannot be named)
	}

--]]
-- Ex:

--  Variable  | Event  | Connect | Function
game.Workspace.Changed:Connect(function()  -- Runs whenever the event is triggered
	-- Code here
end) --- MAKE SURE for every open ( you add closed ), same with [], {}, "", '', ``


--[[ 
If you want to call the function you must make it a variable,
however, there isn't a need to do this unless you need to call the function-
another time. 
--]]

--[[

_________ Global Variables _________

Global variables, can be accessed between scripts 

 Parts of a global var:
 1: _G
 2: .
 3: Variable name
 
 Global variables are differnt for the server and client,
 so if I made a global variable in a ServerScript, only the server can access it.
 If I made it in a LocalScript, only the Client can access it.
--]]

_G.ServerAge = 100

--[In another Server Script you can do]--

print(_G.ServerAge)

--[[

	_________ MATH! Yay :sob:  _________
	
--]]

local min = 1
local max = 100

math.random(min,max) -- Returns a whole value, between the two numbers.
huge =math.huge -- returns the max Integer value 
math.min(205,50,20,205,21,28459,39,1) --- Returns the lowest int value, without it having to be ordered.
math.max(205,50,20,205,21,28459,39,1) --- Returns the highest int value, without it having to be ordered.
math.rad(max) --- Returns the angle
math.round(10.03000301) --- Rounds to nearest whole value
pi = math.pi --- Returns pie 🥟 (not that, this: π)


Vector3.new(0,0,0) -- (X , Y , Z) for a Position or Size or just a vector 3
Vector2.new(0,0) -- (X,Y) Horizontal and Vertical
CFrame.new(Vector3.new(0,0,0),Vector3.new(0,0,0)) -- (X , Y , Z)^2, a Cordinate Frame, has a Position (Vector 3) and Orienation (Vector 3)
---			Position         ,    Orientation
--[[

_________ End of Lua Syntax _________

--]]
