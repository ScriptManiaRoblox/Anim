-- /anim [id] command
registerCommand("anim", function(args)
    local assetId = args[1] or "7721915933" -- defaults to your ID if none provided
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    -- Ensure an Animator exists
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end
    
    -- Stop any currently playing custom animations if needed, then play new one
    pcall(function()
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. assetId
        
        local track = animator:LoadAnimation(animation)
        track:Play()
    end)
end)
