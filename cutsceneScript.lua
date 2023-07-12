local Module = {}



Module["One"] = function()
	--// Preparation \\--
	local TweenService = game:GetService("TweenService")
	local Lighting = game.Lighting
	local AMB_Backup = Lighting.Ambient
	local ODA_Backup = Lighting.OutdoorAmbient
	local Bright_Backup = Lighting.Brightness
	local Atmo_Backup = Lighting:WaitForChild("Atmosphere").Density
	local Sky_Backup = Lighting:WaitForChild("Sky"):Clone()
	local Clouds = workspace.Terrain:WaitForChild("Clouds")
	Sky_Backup.Parent = script
	local Camera = workspace.CurrentCamera
	local PlayerGui = script.Parent.Parent
	local CutSceneGui = PlayerGui:WaitForChild("CutsceneGui")
	local StoryTeller = CutSceneGui:WaitForChild("StoryTeller")
	local FadeFrame = PlayerGui.GlobalGui.FadeFrame
	local Logo = PlayerGui.IntroGui.Logo
	game.ReplicatedStorage.ImportCutscene:FireServer("Cutscene1")
	local Cutscene = game.ReplicatedStorage.CutsceneTransfer:WaitForChild("Cutscene1"):Clone()
	Cutscene.Parent = workspace.Cutscenes
	game.ReplicatedStorage.CutsceneTransfer:WaitForChild("Cutscene1"):Destroy()
	local GalaxySky = Cutscene:WaitForChild("GalaxySky"):Clone()
	local NormalSky = Cutscene:WaitForChild("Sky"):Clone()
	local Animation = Cutscene:WaitForChild("Animation")
	Cutscene:WaitForChild("NPC1"):WaitForChild("HumanoidRootPart").Anchored = false
	Cutscene:WaitForChild("NPC1"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(Animation):Play()
	wait(0.125)
	Cutscene:WaitForChild("NPC2"):WaitForChild("HumanoidRootPart").Anchored = false
	Cutscene:WaitForChild("NPC2"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(Animation):Play()
	wait(0.125)
	Cutscene:WaitForChild("NPC3"):WaitForChild("HumanoidRootPart").Anchored = false
	Cutscene:WaitForChild("NPC3"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(Animation):Play()
	wait(0.125)
	Cutscene:WaitForChild("NPC4"):WaitForChild("HumanoidRootPart").Anchored = false
	Cutscene:WaitForChild("NPC4"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(Animation):Play()
	Clouds.Enabled = false
	Lighting:WaitForChild("Atmosphere").Density = 0
	Lighting.Brightness = 5
	Lighting.Ambient = Color3.fromRGB(0,0,0)
	Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
	Lighting.ClockTime = 8
	GalaxySky.Parent = Lighting
	local Tween1 = TweenService:Create(
		Camera,
		TweenInfo.new(
			14,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.InOut),
		{CFrame = Cutscene:WaitForChild("C_2").CFrame})
	local Tween2 = TweenService:Create(
		Camera,
		TweenInfo.new(
			14,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.InOut),
		{CFrame = Cutscene:WaitForChild("C_4").CFrame})
	--// Scene 1 \\-- [Time: 12.00 / Total: 12.00 / Max: 63.00 / AVG: 12.20]
	FadeFrame.BackgroundTransparency = 1
	for i = 1,50 do
		FadeFrame.BackgroundTransparency -= 0.02
		wait(0.02)
	end
	FadeFrame.BackgroundTransparency = 0
	Logo.Visible = false
	wait(1)
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = Cutscene:WaitForChild("C_1").CFrame
	Camera.Focus = Cutscene:WaitForChild("F_1").CFrame
	StoryTeller.Visible = true
	Cutscene:WaitForChild("CutsceneMusic"):Play()
	Tween1:Play()
	--Time starts here [0.00]
	wait(3) -- [3.00]
	for i = 1,50 do -- [5.50]
		FadeFrame.BackgroundTransparency += 0.02
		wait(0.05)
	end
	wait(0.5) -- [6.00]
	FadeFrame.BackgroundTransparency = 1
	StoryTeller.Text = "This beautifull planet is known as Oasius"
	StoryTeller.TextTransparency = 1
	for i = 1,50 do -- [7.00]
		StoryTeller.TextTransparency -= 0.02
		wait(0.02)
	end
	wait(2) -- [9.00]
	for i = 1,50 do -- [11.50]
		FadeFrame.BackgroundTransparency -= 0.02
		wait(0.05)
	end
	FadeFrame.BackgroundTransparency = 0
	GalaxySky:Destroy()
	wait(1) -- [12.50]
	--// Scene 2 \\-- [Time: 12.00 / Total: 24.50 / Max: 63.00 / AVG: 12.20]
	NormalSky.Parent = Lighting
	Clouds.Enabled = true
	Clouds.Cover = 0.7
	Lighting:WaitForChild("Atmosphere").Density = 0.2
	Lighting.Brightness = 1
	Lighting.Ambient = Color3.fromRGB(96,96,96)
	Lighting.OutdoorAmbient = Color3.fromRGB(127,127,127)
	Lighting.ClockTime = 17.8
	Camera.CFrame = Cutscene:WaitForChild("C_3").CFrame
	Camera.Focus = Cutscene:WaitForChild("F_2").CFrame
	StoryTeller.Text = "This planet was the happy home of the Kikorians for many milleniums"
	StoryTeller.TextTransparency = 1
	Tween2:Play()
	for i = 1,50 do -- [15.00]
		FadeFrame.BackgroundTransparency += 0.02
		wait(0.05)
	end
	FadeFrame.BackgroundTransparency = 1
	for i = 1,50 do -- [16.00]
		StoryTeller.TextTransparency -= 0.02
		wait(0.02)
	end
	wait(5) -- [21.00]
	for i = 1,50 do -- [23.50]
		FadeFrame.BackgroundTransparency -= 0.02
		wait(0.05)
	end
	FadeFrame.BackgroundTransparency = 0
	wait(1) -- [24.50]
	--// Scene 3 \\-- [Time: 0.00 / Total: 0.00 / Max: 63.00 / AVG: 12.20]
end



return Module
