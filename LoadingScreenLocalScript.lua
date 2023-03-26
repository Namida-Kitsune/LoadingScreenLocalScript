-- RemoveDefaultLoadingScreen
local ReplicatedFirst = game:GetService("ReplicatedFirst")
ReplicatedFirst:RemoveDefaultLoadingScreen()

-- Disabled CoreGui
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

-- Create Default Loading Screen
local LoadingScreen = Instance.new("ScreenGui",script)
LoadingScreen.Enabled = true
LoadingScreen.IgnoreGuiInset = true
LoadingScreen.Name = "LoadingScreen"
LoadingScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LoadingScreen.DisplayOrder = 100

local Background = Instance.new("Frame", LoadingScreen)
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Background.BorderSizePixel = 0
Background.Name = "Background"
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(1, 0, 1, 0)

local WordTextLabel = Instance.new("TextLabel", Background)
WordTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
WordTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WordTextLabel.Transparency = 1
WordTextLabel.BorderSizePixel = 0
WordTextLabel.Name = "WordTextLabel"
WordTextLabel.Position = UDim2.new(0.4, 0, 0.25, 0)
WordTextLabel.Size = UDim2.new(0.3, 0, 0.3, 0)
WordTextLabel.Font = Enum.Font.FredokaOne
WordTextLabel.RichText = true
WordTextLabel.Text = "Word"
WordTextLabel.TextColor3 = Color3.fromRGB(0, 85, 255)
WordTextLabel.TextScaled = true
WordTextLabel.TextStrokeTransparency = 1
WordTextLabel.TextTransparency = 0

local RankingTextLabel = Instance.new("TextLabel", Background)
RankingTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
RankingTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RankingTextLabel.Transparency = 1
RankingTextLabel.BorderSizePixel = 0
RankingTextLabel.Name = "RankingTextLabel"
RankingTextLabel.Position = UDim2.new(0.6, 0, 0.4, 0)
RankingTextLabel.Size = UDim2.new(0.3, 0, 0.3, 0)
RankingTextLabel.Font = Enum.Font.FredokaOne
RankingTextLabel.RichText = true
RankingTextLabel.Text = "Ranking"
RankingTextLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
RankingTextLabel.TextScaled = true
RankingTextLabel.TextStrokeTransparency = 1
RankingTextLabel.TextTransparency = 0

local AssetTextLabel = Instance.new("TextLabel", Background)
AssetTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
AssetTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AssetTextLabel.Transparency = 1
AssetTextLabel.BorderSizePixel = 0
AssetTextLabel.Name = "AssetTextLabel"
AssetTextLabel.Position = UDim2.new(0.5, 0, 0.84, 0)
AssetTextLabel.Size = UDim2.new(0.6, 0, 0.05, 0)
AssetTextLabel.Font = Enum.Font.FredokaOne
AssetTextLabel.RichText = true
AssetTextLabel.Text = "Loading . . . [0/100]"
AssetTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AssetTextLabel.TextScaled = true
AssetTextLabel.TextStrokeTransparency = 1
AssetTextLabel.TextTransparency = 0

local FullLoading = Instance.new("Frame", Background)
FullLoading.AnchorPoint = Vector2.new(0.5, 0.5)
FullLoading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FullLoading.Transparency = 0.9
FullLoading.Name = "FullLoading"
FullLoading.Position = UDim2.new(0.5, 0, 0.9, 0)
FullLoading.Size = UDim2.new(0.6, 0, 0.05, 0)

local UICorner = Instance.new("UICorner", FullLoading)
UICorner.CornerRadius = UDim.new(0.2, 0)

local Loading = Instance.new("Frame", FullLoading)
Loading.BackgroundColor3 = Color3.fromRGB(89, 0, 243)
Loading.Name = "Loading"
Loading.Position = UDim2.new(0, 0, 0, 0)
Loading.Size = UDim2.new(0, 0, 1, 0)

UICorner:Clone().Parent = Loading

local SkipTextButton = Instance.new("TextButton", FullLoading)
SkipTextButton.Visible = false
SkipTextButton.AnchorPoint = Vector2.new(0.5, 0.5)
SkipTextButton.Transparency = 1
SkipTextButton.BorderSizePixel = 0
SkipTextButton.Name = "SkipTextButton"
SkipTextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
SkipTextButton.Size = UDim2.new(1, 0, 1, 0)
SkipTextButton.Font = Enum.Font.FredokaOne
SkipTextButton.RichText = true
SkipTextButton.Text = "Skip"
SkipTextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SkipTextButton.TextScaled = true
SkipTextButton.TextStrokeTransparency = 1
SkipTextButton.TextTransparency = 0

local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tweenInfoSound = TweenInfo.new(1)
local tweenSoundFadeIn = {Volume = 0.5}
local tweenSoundFadeOut = {Volume = 0}

local selectSoundId = "146730311"
local SelectSound = Instance.new("Sound", SkipTextButton)
SelectSound.SoundId = "rbxassetid://" .. selectSoundId

local clickSoundId = "452267918"
local ClickSound = Instance.new("Sound", SkipTextButton)
ClickSound.SoundId = "rbxassetid://" .. clickSoundId

local loadingSoundId = "9043887091"
local LoadingSound = Instance.new("Sound", LoadingScreen)
LoadingSound.SoundId = "rbxassetid://" .. loadingSoundId
LoadingSound.Looped = true
LoadingSound.Volume = 0
LoadingSound:Play()
TweenService:Create(LoadingSound, tweenInfoSound, tweenSoundFadeIn):Play()

-- Move LoadingScreen To PlayerGui
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
LoadingScreen.Parent = playerGui

-- Fake Object Loading
local fakeAsset = game:GetDescendants()
local totalAsset = #fakeAsset
local assetIndex = 0

-- Loading Fake Object For Wait Real Object
for index, value in pairs(fakeAsset) do
	ContentProvider:PreloadAsync({value})
	assetIndex += 1
	AssetTextLabel.Text = "Loading . . . " .. value.Name .. " [" .. assetIndex .. "/" .. totalAsset .. "]"
	TweenService:Create(Loading, tweenInfo, {Size = UDim2.new(assetIndex/totalAsset,0,1,0)}):Play()
	task.wait(0.004)
end

SkipTextButton.MouseLeave:Connect(function()
	SkipTextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

SkipTextButton.MouseEnter:Connect(function()
	SelectSound:Play()
	SkipTextButton.TextColor3 = Color3.fromRGB(223, 223, 223)
end)

SkipTextButton.MouseButton1Click:Connect(function()
	ClickSound:Play()
	TweenService:Create(LoadingSound, tweenInfoSound, tweenSoundFadeOut):Play()
	task.wait(1)
	LoadingSound:Stop()
	LoadingScreen:Destroy()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
end)

SkipTextButton.Visible = true

-- Read Object Loading
local realAsset = game:GetService("Workspace"):GetDescendants()
totalAsset += #realAsset

-- Loading Real Object
for index, value in pairs(realAsset) do
	ContentProvider:PreloadAsync({value})
	assetIndex += 1
	AssetTextLabel.Text = "Loading . . . " .. value.Name .. " [" .. assetIndex .. "/" .. totalAsset .. "]"
	TweenService:Create(Loading, tweenInfo, {Size = UDim2.new(assetIndex/totalAsset,0,1,0)}):Play()
	task.wait(0.004)
end

if assetIndex == totalAsset then
	TweenService:Create(LoadingSound, tweenInfoSound, tweenSoundFadeOut):Play()
	task.wait(1)
	LoadingSound:Stop()
	LoadingScreen:Destroy()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
end
