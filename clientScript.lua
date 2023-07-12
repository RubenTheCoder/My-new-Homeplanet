--< 👤 LOCAL_SYSTEM 👤 >--
warn("The following system is booting up: 👤 LOCAL_SYSTEM 👤")



--// 📜 [SYSTEM DESCRIPTION] 📜 \\--



--// 📘 [SYSTEM MANUAL] 📘 \\--



--// ⚙️ [SETTINGS] ⚙️ \\--



--// ❗️ [SHORTCUTS] ❗️ \\--



--// 🔧 [SERVICES] 🔧 \\--
TweenService = game:GetService("TweenService")
RepliStorage = game.ReplicatedStorage
Players = game.Players



--// 📡 [REMOTES] 📡 \\--
IntroRemote = RepliStorage:WaitForChild("IntroRemote")



--// 📋 [INSTANCES] 📋 \\--
Camera = workspace.CurrentCamera



--// 📅 [MODULES] 📅 \\--
Cutscenes = require(script:WaitForChild("Cutscenes"))



--// ⚠️ [IMPORTANT VARIABLES] ⚠️ \\--
PlayerGui = script.Parent
IntroGui = PlayerGui:WaitForChild("IntroGui")
Logo = IntroGui:WaitForChild("Logo")
Warning = IntroGui:WaitForChild("Warning")
LoadScreen = IntroGui:WaitForChild("LoadScreen")
GlobalGui = PlayerGui:WaitForChild("GlobalGui")
FadeFrame = GlobalGui:WaitForChild("FadeFrame")



--// ⚠️ [IMPORTANT FUNCTIONS] ⚠️ \\--
function PlayFade(ScreenToOpen,ScreenToClose)
	FadeFrame.BackgroundTransparency = 1
	for i = 1,50 do
		FadeFrame.BackgroundTransparency -= 0.02
		wait(0.02)
	end
	FadeFrame.BackgroundTransparency = 0
	wait(1)
	ScreenToOpen.Visible = true
	ScreenToClose.Visible = false
	for i = 1,50 do
		FadeFrame.BackgroundTransparency += 0.02
		wait(0.02)
	end
	FadeFrame.BackgroundTransparency = 1
end



--// 💿 [VARIABLES] 💿 \\--



--// 📺 [FUNCTIONS] 📺 \\--
function PlayIntro(NewPlayer)
	Warning.Visible = true -- Shows the warning gui
	local WarningLoadLabel = Warning:WaitForChild("LoadLabel")
	for i = 1,1 do
		WarningLoadLabel.Text = "Loading"
		wait(0.25)
		WarningLoadLabel.Text = "Loading."
		wait(0.25)
		WarningLoadLabel.Text = "Loading.."
		wait(0.25)
		WarningLoadLabel.Text = "Loading..."
		wait(0.25)
	end
	PlayFade(Logo,Warning) -- Closes the warning and prepares the logo animation
	local Red = Logo:WaitForChild("Red")
	local Orange = Logo:WaitForChild("Orange")
	local Green = Logo:WaitForChild("Green")
	local Blue = Logo:WaitForChild("Blue")
	local RedTarget = Logo:WaitForChild("RedTarget")
	local OrangeTarget = Logo:WaitForChild("OrangeTarget")
	local GreenTarget = Logo:WaitForChild("GreenTarget")
	local BlueTarget = Logo:WaitForChild("BlueTarget")
	local TextLabel = Logo:WaitForChild("TextLabel")
	local Woosh = script:WaitForChild("IntroWoosh")
	local Chime = script:WaitForChild("IntroChime")
	
	Woosh:Play() -- Plays the logo animation
	Red:TweenPosition(
		RedTarget.Position,
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		1,
		true)
	Orange:TweenPosition(
		OrangeTarget.Position,
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		1,
		true)
	Green:TweenPosition(
		GreenTarget.Position,
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		1,
		true)
	Blue:TweenPosition(
		BlueTarget.Position,
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		1,
		true)
	wait(1)
	Chime:Play()
	for i = 1,50 do -- Shows the "company" name
		TextLabel.TextTransparency -= 0.02
		wait(0.01)
	end
	wait(1)
	if NewPlayer then
		Cutscenes.One()
	else
		PlayFade(Logo,Logo)
	end
end



--// 📨 [CONNECTORS] 📨 \\--
IntroRemote.OnClientEvent:Connect(PlayIntro)






--// 🔰 [MAIN CODE] 🔰 \\--
warn("The following system has succesfully booted up: 👤 LOCAL_SYSTEM 👤")
