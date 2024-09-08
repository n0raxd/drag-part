local function addDragDetectorToPart(part)
    if part:IsA("BasePart") and not part.Anchored then
        if not part:FindFirstChildOfClass("DragDetector") then
            local dragDetector = Instance.new("DragDetector")
            dragDetector.RunLocally = true
            dragDetector.MaxForce = math.huge -- Allow maximum force for easier dragging
            dragDetector.MaxActivationDistance = math.huge -- Allow dragging from any distance
            dragDetector.Parent = part
        end
    end
end

-- Add DragDetector to existing unanchored parts
for _, part in ipairs(workspace:GetDescendants()) do
    addDragDetectorToPart(part)
end

-- Listen for new parts added to the workspace
workspace.DescendantAdded:Connect(function(descendant)
    addDragDetectorToPart(descendant)
end) 
