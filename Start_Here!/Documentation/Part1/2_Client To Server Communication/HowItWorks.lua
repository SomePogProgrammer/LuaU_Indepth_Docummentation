--[[
        ____					   _____
	|  |		|  |	   |  |	       	  /  _  \
	|  |		|  |	   |  |	     	 /  / \  \
	|  |		|  |	   |  |	    	/  /___\  \
	|  |		|  |	   |  |	       /  ______   \
	|  |   		|  |	   |  |	      /	 /	 \  \
	|  |		|  |	   |  |	     /	/	  \  \
	|  |		|  |	   |  |	    /  /	   \  \
	|  |_ _ _ _ _	\  \_ _ _ /  / 	   /  /		    \  \
	|_ _ _ _ _ _ |	 \_ _ _ _ _ /	  /__/		     \__\
	
	

	CLIENT 🙍 ->  TO  -> SERVER  🖥️   COMMUNICATION 
]]--
	



--[[

⚠️ THIS WILL BE MOSTLY TEXT sorry :( ik boring, but THIS IS VERY IMPORTANT TO UNDERSTAND ⚠️


So what is Client -> Server Communication❓

Basically, 
in order for you to understand this you need to understand there are 2 Parts of Development:

[1]: Front End (Client, Runs on the Player's Computer or Router), 
and 
[2]: Back  End (Server, Runs on the Server roblox provides.)

There's perks to each side, they both are needed to make a multiplayer game. 

---------------------- ///// 🙍 CLIENT 🙍 \\\\\ ----------------------

Lets start off with what the CLIENT OFFERS: 
]]
THECLIENT = {

	[1] = {
		`The player is automatically defined, when programming on the client`,
		`you can get the player via:`, game.Players.LocalPlayer
	},
	[2] = {
		`You don't have to worry about if your affecting other player's performances.`
	},
	[3] = {
		`Your able to use certain Services that the server can't, such as` 
			, game:GetService("UserInputService"), game:GetService("RunService") 
	},
	[4] = {
		`Your able to program, create, and manipulate the player's User Interface (UI)`
	}
		
}

--[[
The client changes stuff only for the LocalPlayer, so keep that in mind when using the client,
If you create a part on the client, only the LocalPlayer will be able to see it. That part also
won't be visible from the server. Any changes made by the client aren't visible by the server.


---------------------- ///// 🖥️ SERVER 🖥️ \\\\\ ----------------------

Lets talk about what the SERVER OFFERS:
--]]

THESERVER = {
	[1] = {
		`The server can communicate with the client and creates stuff for every player in the game.`,
		`The server can send messages to all connected clients.`
	},
	[2] = {
		`The server is much more secure, as the client can't access certain things on the server.`,
		`This means you can store data on the server and not have to worry if other clients can access it`,
		`Watch out for Remotes, if handled improperly they can be spammed and crash your server!`
	},
	[3] = {
		`The server allows you to manipulate the workspace for every client, along with picking out individual players,`,
		`The server allows you to use APIs and certain services to store data, and unlock the full potential of your game!`,
		`These services include,` , game:GetService("DataStoreService") , game:GetService("HttpService")
	},
	[4] = {
		`Using the server you can manipulate the server far better, and you can use it to communicate to other clients,`,
		`You can also use the server to individually manipulate UI, or create GUI (Generated User Interface) and parent it`,
		`on event, or on click, just make sure you handle it properly as to not affect other clients.`
	}
}

--[[

---------------------- ///// ⚠️IMPORTANT TO REMEMBER⚠️  \\\\\ ----------------------

---
The Client and Server can always view ReplicatedStorage

Only the Server Can view ServerScriptService & ServerStorage
---

The Client, CAN read changes from the server.

The Server, CANNOT read changes from the client. 

---------------------------------------------
HOW DO I CHANGE THAT? 

Well lets say you want the server to know something but your scripting in a localscript
no worries, there is something called a "Remote", there are 2 Remotes, the RemoteEvent and RemoteFunction.

Difference? Simple. 

RemoteEvents: 

When you fire the client or the server using a remote event, you can connect it to a function.
The script that fired it doesn't expect a response back. 

Example:
]]

--- SERVER SCRIPT ---

function serverScript1() 
	local RemoteEvent = Instance.new("RemoteEvent") --- Imagine this remote is created by the server
	RemoteEvent.Parent = game:GetService("ReplicatedStorage")
	RemoteEvent.Name = "RemoteEvent"  

	RemoteEvent.OnServerEvent:Connect(function(plr,Team) -- Player is automatically defined 
		if game.Teams[Team] then -- Makes sure the Team Exists
			plr.Team = game.Teams[Team]
		end
	end)
end

serverScript1()

--- LOCAL SCRIPT ---
-- (Lets say this script is a team change UI programmed on the Client)
-- In order for the player's team to change it must be done by the server, so we need to let the server know

function localscript1()
	local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")
	local Team  = "Red"

	RemoteEvent:FireServer(Team) 
end
localscript1()
-- When firing from the client, it automatically sends the plr, along with any other params.
--[[

Your also able to fire an event from the server to a specific client
here's an example:
--]]

--- SERVER SCRIPT ---
game.Players.PlayerAdded:Connect(function(plr)
	local RemoteEvent = Instance.new("RemoteEvent") --- Imagine this remote is created by the server
	RemoteEvent.Parent = game:GetService("ReplicatedStorage")
	RemoteEvent.Name = "RemoteEvent"  

	local data = 10
	
	RemoteEvent:FireClient(plr,data) -- If you want to fire to a specific client (player)
	
	RemoteEvent:FireAllClients(data) -- If you want to fire to all clients (players)
end)

--- LOCAL SCRIPT ---

local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

RemoteEvent.OnClientEvent:Connect(function(data) -- Recieves event
	local plr = game.Players.LocalPlayer
	local UI = plr.PlayerGui.MoneyUI
	
	UI.CoinText.Text = tostring(data)
end)


--[[

------------------ REMOTE FUNCTIONS ------------------

Now we just saw how amazing RemoteEvents are, what's the difference though between
Remote Events and Remote Functions?


Well the difference is that Remote Functions when fired, 
they return a value back to the script which fired it.

Heres an example (Client -> Server):
]]

--- SERVER SCRIPT ---
function serverScript2()
	local RemoteFunction = Instance.new("RemoteFunction")
	RemoteFunction.Parent = game:GetService("ReplicatedStorage")
	RemoteFunction.Name = "RemoteFunction"
	local SessionData = {}
	
	RemoteFunction.OnServerInvoke(function(plr,data)
	if data then
		SessionData[plr.Name] = data
		return "Data added successfully"
	else
		return "Error with adding data"
	end
end)
end
serverScript2()

--- LOCAL SCRIPT ---
-- (Lets say we had a save data button)
local plr = game.Players.LocalPlayer
local RemoteFunction = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction")
local UI = plr.PlayerGui.UI
local plrData = {} 
local updateBtn = UI.updateBtn

updateBtn.MouseButton1Click:Connect(function()
	local dataSaveStatus = RemoteFunction:InvokeServer(plrData) -- Expects it to return a string
	-- The script will wait until it gets a response from the server (response = returned value)
	updateBtn.Text = dataSaveStatus
	task.wait(3)
	updateBtn.Text = "Click To Save Data"
end)

--]]
