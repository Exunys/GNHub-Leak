getgenv().boostFPS = true 

repeat task.wait() until game:IsLoaded();

local vim = game:GetService("VirtualInputManager")
local CoreGui = game:GetService("CoreGui")


setfpscap(5000)

CoreGui.DescendantAdded:Connect(function(d)
   if d.Name == "MainView" and d.Parent.Name == "DevConsoleUI" and boostFPS then
       task.wait()
       local screen = d.Parent.Parent.Parent
       screen.Enabled = false;
   end
end)

vim:SendKeyEvent(true, "F9", 0, game)    
wait()
vim:SendKeyEvent(false, "F9", 0, game)  

setfpscap(5000)

task.spawn(function()
	while true do task.wait()

        if not getgenv().boostFPS then
            local panel = CoreGui:FindFirstChild("DevConsoleMaster", true);

            if panel then
                panel.Enabled = true;
                vim:SendKeyEvent(true, "F9", 0, game)    
                vim:SendKeyEvent(false, "F9", 0, game)  
                repeat task.wait() until boostFPS
            end

            continue;
        end


		warn("")

		if not CoreGui:FindFirstChild("DevConsoleUI", true):FindFirstChild("MainView") then
			vim:SendKeyEvent(true, "F9", 0, game)    
			wait()
			vim:SendKeyEvent(false, "F9", 0, game)  
			continue
		end
	end
end)