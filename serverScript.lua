--< 🔰 MAIN_SYSTEM 🔰 >--
warn("The following system is booting up: 🔰 MAIN_SYSTEM 🔰")



--// 📜 [SYSTEM DESCRIPTION] 📜 \\--



--// 📘 [SYSTEM MANUAL] 📘 \\--



--// ⚙️ [SETTINGS] ⚙️ \\--



--// ❗️ [SHORTCUTS] ❗️ \\--



--// 🔧 [SERVICES] 🔧 \\--
Server = game.ServerStorage
RepliStorage = game.ReplicatedStorage
DatastoreService = game:GetService("DataStoreService")
Debris = game:GetService("Debris")
Players = game.Players



--// 📡 [REMOTES] 📡 \\--
IntroRemote = RepliStorage.IntroRemote
CutsceneRemote = RepliStorage.ImportCutscene



--// 📋 [INSTANCES] 📋 \\--
Cutscenes = Server.Cutscenes



--// 📅 [MODULES] 📅 \\--



--// ⚠️ [IMPORTANT VARIABLES] ⚠️ \\--
Datastore = DatastoreService:GetDataStore("PlayerData")



--// ⚠️ [IMPORTANT FUNCTIONS] ⚠️ \\--
function LoadData(UserId,Savegame,Repeat) -- This handles getting the PlayerData
	local PlayerData
	repeat -- This repeats the loading process until it has success or it may not repeat
		local Success, Outcome = pcall(function() -- Actual loading
			PlayerData = Datastore:GetAsync("P:"..UserId.."F:"..Savegame.."")
		end)
		if Success then -- Check if it has PlayerData and if not, gives it the Intro
			if not PlayerData then
				PlayerData = "Intro"
			end
		else -- This warns that the loading failed
			warn("UserId "..UserId.." could not load Data! Error: "..Outcome.."")
		end
	until PlayerData or not Repeat
	return PlayerData -- Sends back the PlayerData
end



--// 💿 [VARIABLES] 💿 \\--



--// 📺 [FUNCTIONS] 📺 \\--
function ExportCutscene(Player,CutsceneRequest)
	local Cutscene = Cutscenes:FindFirstChild(CutsceneRequest):Clone()
	Cutscene.Parent = RepliStorage.CutsceneTransfer
	Debris:AddItem(Cutscene,300)
end



function PlayerJoined(Player)
	local PlayerName = Player.Name -- Set up variables for the player itself
	local UserId = Player.UserId
	local PlayerData = LoadData( -- Load up savegame data
		UserId,
		"Global",
		true)
	local NewPlayer
	if PlayerData == "Intro" then -- Introduce the player or else let him go to the menu
		NewPlayer = true
	end
	IntroRemote:FireClient(Player,NewPlayer)
end



--// 📨 [CONNECTORS] 📨 \\--
Players.PlayerAdded:Connect(PlayerJoined)
CutsceneRemote.OnServerEvent:Connect(ExportCutscene)







--// 🔰 [MAIN CODE] 🔰 \\--
warn("The following system has succesfully booted up: 🔰 MAIN_SYSTEM 🔰")
