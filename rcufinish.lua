local a={ 
    
    { ClassName="LocalScript", Closure=function() if(not game:IsLoaded())then game.Loaded:Wait() 

end if Fluent then Fluent.Destroy()end local 

a=require(script.Library);
 a.Debug=true; 
 
 local b=a.Libraries 
 local c=a.Services 
 local d=a.Variables 
 local e=b.Generic 
 local f=b.Special 
 local g=b.RBXUtil 
 local h= g.Tree 
 local i=g.Promise 
 local j= g.Signal 
 local k= g.Trove 
 local l=g.TableUtil 
 local m=f.GameModules.Get() 
 local n=e.Interface.Get() 
 local o=e.Threading 
 local p=a.Functions 
 local q=p.Special 
 local r=p.Generic 
 local s=d.LRM_Variables 
 local t=c.Players 
 local u= c.RunService 
 local v= c.Workspace
 local w= c.ReplicatedStorage 
 local x= c.UserInputService 
 local y= c.GuiService 
 local z=c.CoreGui 
 local A=c.CollectionService 
 local B=t.LocalPlayer 
 local C=game.FindFirstChild
 local D=game.FindFirstChildWhichIsA 
 local E= game.FindFirstAncestor 
 local F= game.IsA 
 local G=m.Knit;
  local H=G.GetService'ClickService' 
  local I=G.GetService'RebirthService' 
  local J=G.GetService'EggService'
   local K=G.GetService'FarmService'
    local L=G.GetService'UpgradeService'
     local M=G.GetService'RewardService' 
     local N=G.GetService'PetService' 
     local O=G.GetService'IndexService'
      local P=G.GetService'PrestigeService' 
      local Q=G.GetService'InventoryService' 
      local R=G.GetController'HatchingController'
       local S=G.GetController'FarmController' 
       local T=G.GetController'DataController';T:waitForData(); 
       local U=T.replica local V=m.Functions 
       local W= m.Variables setthreadidentity(8);setthreadcontext(8); 
       local X=a.Cache.ScriptCache X.InitTime=DateTime.now().UnixTimestamp 
       local Y=o.new'MainThread' 
       local Z=n.Fluent local _=n.SaveManager
        local aa=n.ThemeManager getgenv().Fluent=Z 
        local ab=Z:CreateWindow{ Title="rawhead's RCU private script", SubTitle="raw"..s.LRM_ScriptVersion, TabWidth=120, Size=UDim2.fromOffset(600,480), Resize=true, MinSize=Vector2.new(430,350), Acrylic=false, Theme="Darker", MinimizeKey=Enum.KeyCode.LeftControl } local ac={ Home=ab:CreateTab{ Title="Home", Icon="house" }, Farming=ab:CreateTab{ Title="Farming", Icon="egg" }, Crops=ab:CreateTab{ Title="Crops", Icon="wheat" }, Misc=ab:CreateTab{ Title="Others", Icon="circle-ellipsis" }, Settings=ab:CreateTab{ Title="Settings", Icon="settings" }, } local ad={ Home_Information=ac.Home:AddSection"↳ Information", Home_Credits=ac.Home:AddSection"↳ Credits", Farming_Clicking=ac.Farming:AddSection"↳ Clicking", Farming_Rebirth=ac.Farming:AddSection"↳ Rebirthing", Farming_Hatching=ac.Farming:AddSection"↳ Hatching", Farming_Upgrades=ac.Farming:AddSection"↳ Upgrades", Crops_Claim=ac.Crops:AddSection"↳ Auto Claim", Crops_Upgrade=ac.Crops:AddSection"↳ Auto Upgrade", Other_Chests=ac.Misc:AddSection"↳ Chests", Other_Items=ac.Misc:AddSection"↳ Items", Other_Combining=ac.Misc:AddSection"↳ Combining", Other_Misc=ac.Misc:AddSection"↳ Misc" } do local ae=ad.Home_Information:CreateParagraph("ClientUptimeParagraph",{ Title="Client Uptime: nil", TitleAlignment=Enum.TextXAlignment.Center, }); o.new("ClientUptimeParagraph",function(af) while Z.Loaded and task.wait(1)do ae.Instance.TitleLabel.Text=string.format("Script Uptime: %s",r.FormatHms(r.GetUptime())) end end):Start()
         local af=ad.Home_Information:CreateParagraph("LuaHeapParagraph",{ Title="Lua Heap (Megabytes): nil", TitleAlignment=Enum.TextXAlignment.Center, }); o.new("LuaHeapParagraph",function(ag) while Z.Loaded and task.wait(1)do af.Instance.TitleLabel.Text=string.format('Lua Heap: %sMB', tostring(r.CommaNumber(math.ceil(gcinfo()/1000)))) end end):Start() 
         ad.Home_Information:CreateButton{ Title="Join Discord", Description="prompts discord invite if the user is on pc, copies to clipboard otherwise", Callback=function() r.PromptDiscordJoin('ECwtjqzA',true) 
        Z:Notify{ Title="Discord Prompted/Copied", Content="discord invite has been prompted/copied to your clipboard!", Duration=2 } end }
        ad.Home_Credits:CreateParagraph("Credits",{ Title="BIG CREDITS TO 1312vma", TitleAlignment=Enum.TextXAlignment.Center, });
    
    end do 
        
        
        -- autoclick toggle
        local ae=ad.Farming_Clicking:Toggle("AutoClickToggle",
        {Title="Auto Click",Default=false,Description="automatically clicks for you"})
        ae:OnChanged(function(af) if not af then o.TerminateByIndex'AutoClickToggle' 
        return end o.new('AutoClickToggle',function(ag) while Z.Loaded and task.wait()do H.click:Fire() end end):Start() end)
        
        -- auto rebirth toggle
        local af=i.promisify(V.suffixes) local function ag() local ah=q.GetUnlockedRebirthOptions(); 
        local ai={}; for aj,ak in ah do 
        local al, am=af(ak):await() table.insert(ai,{ Name=string.format('%s Rebirths', tostring(am)), Value=aj }) end table.insert(ai,{Name='Best Option Unlocked',Value=math.huge}) return ai end 
        local ah=ag() local ai=ad.Farming_Rebirth:Dropdown("RebirthsDropdown",{ Title="Rebirth Option", Description="determines which rebirth option will be bought",
        Values=ah, Displayer=function(ai) return ai.Name end, Multi=false, })         
        local aj=i.promisify(function(aj)ai:SetValues(aj)end); Y:Add(U:OnSet({'upgrades'},function() setthreadcontext(8) setthreadidentity(8) aj(ag()):catch(warn):await() end),'Disconnect')         
        local ak=ad.Farming_Rebirth:Toggle("AutoRebirthToggle",{Title="Auto Rebirth",Default=false,Description="automatically rebirths for you based on the preference above"}) ak:OnChanged(function(al) if not al then o.TerminateByIndex'AutoRebirthToggle' return end o.new('AutoRebirthToggle',function(am) while Z.Loaded and task.wait(1.6666666666666665E-2)do  
        local an=ai.Value; if not an then continue end local ao=(an.Value==math.huge and q.GetBestRebirthOption())or an.Value if q.CanAffordRebirth(ao)then I:rebirth(ao) end 
    
    end 
end)
:Start()
end) 



-- auto hatching toggle
local al={}; for am,an in m.Eggs do table.insert(al,{ Name=string.format('%s Egg | Price: %s', tostring(am), tostring(V.suffixes(an.cost))), 
Value=am, Cost=an.cost or 0 }) end;table.sort(al,function(am,an)return am.Cost>an.Cost end) 
local am=ad.Farming_Hatching:Dropdown("EggDropdown",{ Title="Selected Egg", Description="determines which egg will be hatched", Values=al, 
Searchable=true, AutoDeselect=true, Displayer=function(am) return am.Name end, Multi=false, }) r.AssertFunctions({'hookfunction'},function() 
    local an=ad.Farming_Hatching:Toggle("HideHatchAnimation",{Title="Hide Hatch Animation",Default=false,Description="prevents the eggs from showing up on screen"}) 
    local ao; ao=hookfunction(R.eggAnimation,function(ap,...) if an.Value then return nil end return ao(ap,...) end) 
    Y:Add(function() hookfunction(R.eggAnimation,ao) end) end,function(an) ad.Farming_Hatching:CreateParagraph("MissingFunctionAssertion",
    { Title="Unsupported Feature: Hide Hatch Animation", TitleAlignment=Enum.TextXAlignment.Center, Content=string.format([[This feature cannot be used because your executor doesn't support following functions: %s]], 
    tostring(table.concat(an,', '))),ContentAlignment=Enum.TextXAlignment.Center }); end) 
    local an=ad.Farming_Hatching:Toggle("AutoOpenEggs",{Title="Auto Open Eggs",Default=false,Description="automatically opens eggs based on the configuration above"}) 
    an:OnChanged(function(ao) if not ao then o.TerminateByIndex'AutoOpenEggs' return end o.new('AutoOpenEggs',function(ap) while Z.Loaded and task.wait(1.6666666666666665E-2)do 
    local aq=am.Value; if not aq then continue end local ar=m.Eggs[aq.Value].requiredMap if ar and(not T.data.maps[ar])then continue end 
    local as=m.Util.eggUtils.getMaxAffordable(B,T.data,aq.Value); if m.Util.eggUtils.hasEnoughToOpen(T.data,aq.Value,as)then J.openEgg:Fire(aq.Value,as) 
    task.wait(4.15/m.Values.hatchSpeed(B,T.data)) end end end):Start() end) local ao=l.Map(m.Upgrades,function(ao,ap,aq) 
    table.insert(aq,{ Name=V.toPascal(ap), Value=ap }) end) 
        
        
        
        -- auto ugprades toggle
        local ap=ad.Farming_Upgrades:Dropdown("UpgradesDropdown",{ Title="Selected Upgrades", Description="determines which upgrades will be bought", Values=ao, Displayer=function(ap) return ap.Name end, Multi=true, Default={} })
        
        local aq=ad.Farming_Upgrades:Toggle("AutoUpgradeToggle",{Title="Auto Buy Upgrades",Default=false,Description="automatically buys upgrades when possible"})
         aq:OnChanged(function(ar) if not ar then o.TerminateByIndex'AutoUpgradeToggle' 
        return end o.new('AutoUpgradeToggle',function(as) while Z.Loaded and task.wait(0.5)do local at=ap.Value;
                
                
    if l.GetDictionarySize(at)<1 then continue end; for au in at do 
        local av,aw=au.Name,au.Value; 
        local ax=m.Upgrades[aw]; if ax.requiredMap and T.data.maps[ax.requiredMap]==nil then continue end local ay=(T.data.upgrades[aw]or 0)+1 
        local az=ax.upgrades[ay] if not az then continue end if az.cost>T.data.gems then continue end if 
        L:upgrade(aw)=="success"then Z:Notify{Title="rawhead | bought upgrade",Content=string.format('upgrade %s is now level %s', tostring(av), tostring(ay)),Duration=1.5} 
        end 
    end 
end 
end)

:Start() 

end) 

end 
do 
    --auto farm toggle
local ae=l.Map(m.Farms,function(ae,af,ag) table.insert(ag,{ Name=V.toPascal(af), Value=af, IsAFarm=not ae.isNotFarm }) end) 
local af=l.Map(ae,function(af,ag,ah) if not af.IsAFarm then return end table.insert(ah,af) end) 

local ag=ad.Crops_Claim:Dropdown("SelectedClaimFarms",{ Title="Selected Crops", Description="determines which crops will be auto collected", Values=af, Multi=true, Displayer=function(ag) return ag.Name end, Default={} }) 
local ah=ad.Crops_Claim:Toggle("AutoClaimCrops",{Title="Auto Claim Crops",Default=false,Description="automatically claim available crops"}) ah:OnChanged(function(ai) if not ai then o.TerminateByIndex'AutoClaimCrops' return end o.new('AutoClaimCrops',function(aj) while Z.Loaded and task.wait(0.5)do 
local ak=ag.Value; if l.GetDictionarySize(ak)==0 then continue end local al=T.data.farms for am in ak do 
local an=am.Value 
local ao=am.Name if not al[an]then continue end if S:getTimeLeft(an)>0 then continue end if K:claim(an)=="success"then Z:Notify{Title="rawhead | claimed crops",Content=string.format('%s has been claimed!', tostring(ao)),Duration=1.5} 
end 
end 
end 
end)
:Start()
 end) 
 
   -- auto ugprade cops toggle
 local ai=ad.Crops_Upgrade:Dropdown("SelectedUpgradeCrops",{ Title="Selected Upgrades", Description="determines which crops will be upgraded", Values=ae, Multi=true, Displayer=function(ai) return ai.Name end, Default={} }) 
 local aj=ad.Crops_Upgrade:Toggle("AutoUpgradeCrops",{Title="Auto Upgrade Crops",Default=false,Description="automatically upgrades selected crops"}) 
 aj:OnChanged(function(ak) if not ak then o.TerminateByIndex'AutoUpgradeCrops' return end o.new('AutoUpgradeCrops',function(al) while Z.Loaded and task.wait(0.5)do 
    local am=ai.Value; if l.GetDictionarySize(am)==0 then continue end for an in am do 
        local ao=an.Value local ap=an.Name local aq=T.data.farms[ao]; if aq==nil then 
            local ar=m.Farms[ao]; 
            local as=ar.price or math.huge if T.data.gems<=as then continue end if K:buy(ao)=="success"then Z:Notify{Title="rawhead | bought crop farm",Content=string.format('%s has been bought!', tostring(ap)),Duration=1.5} task.wait(0.2)           
            end          
            continue 
        end 

        
        local ar=(aq.stage or 0)+1 local as=m.Farms[ao].upgrades; if not as then continue end local at=as[ar] if not at then continue end 
        local au=at.price or math.huge if T.data.gems<=au then continue end if K:upgrade(ao)=="success"then Z:Notify{Title="rawhead | upgraded crop farm",Content=string.format('%s has been upgraded to stage %s!', tostring(ap), tostring(ar)),Duration=1.5} 
        end 
    end 
end 
end)
:Start()
 end) 
end 
do 
   
   -- auto claim all chest 
    local ae=ad.Other_Chests:Toggle("AutoClaimChests",{Title="Auto Claim Chests",Default=false,Description="automatically claims chests"}) 
    ae:OnChanged(function(af) if not af then o.TerminateByIndex'AutoClaimChests'
         return
         end
          o.new('AutoClaimChests',function(ag) while Z.Loaded and task.wait(0.5)do for ah,ai in m.Chests do if ai.group and select(2,pcall(B.IsInGroup,B,game.CreatorId))~=true 
            then print'Not in group'continue end; local aj=T.data.chests[ah]or 0; if os.time()<aj+ai.cooldown then continue end if M:claimChest(ah)=="success"then Z:Notify{Title="rawhead | claimed chest",Content=string.format('%s chest has been opened!', tostring(ah)),Duration=1.5} 
            
            end
         end
         end
         end)
         :Start()
         end)

          ad.Other_Chests:Button{ Title="Claim Minichests", Description="claims all unlocked chests (areawise)", Callback=function() for af,ag in A:GetTagged'MiniChest'do 
            local ah=D(ag,'ProximityPrompt',true); if not ah then continue end fireproximityprompt(ah,0) fireproximityprompt(ah,1) 
        end 
    end } 

         --- auto use potions
            local af={} for ag,ah in m.Potions do table.insert(af,{ Name=ah.name, Layout=ah.layoutOrder, Value=ag }) end;table.sort(af,function(ag,ah)return ag.Layout>ah.Layout end) 
            local ag=ad.Other_Items:Dropdown("PotionsDropdown",{ Title="Select Potions", Description="determines which potions will be used", Values=af, Multi=true, Displayer=function(ag) return ag.Name end, Default={} }) 
            local ah=ad.Other_Items:Toggle("AutoUsePotions",{Title="Auto Use Potions",Default=false,Description="automatically uses potions (only after current one expires)"}) ah:OnChanged(function(ai) if not ai then o.TerminateByIndex'AutoUsePotions'
                
                return 
             end 
             
             o.new('AutoUsePotions',function(aj) while Z.Loaded and task.wait(0.5)do 
                
                local ak=ag.Value; if l.GetDictionarySize(ak)==0 then continue end; for al in ak do local am=al.Value; if T.data.activeBoosts[am]then continue 
                end 
                
                local an,ao=q.GetItemByName('potion',am); if not an or not ao.am or ao.am<1 then continue end Q:useItem(an,{use=1}) 
            end 
        end 
    end)
    :Start()
 end)


 -- auto claim boxes
 local ai={} for aj,ak in m.Boxes do table.insert(ai,{ Name=ak.name, Layout=ak.layoutOrder, Value=aj }) 
end;
table.sort(ai,function(aj,ak)return aj.Layout>ak.Layout end) local aj=ad.Other_Items:Dropdown("BoxesDropdown",{ Title="Select Boxes", Description="determines which boxes will be opened", Values=ai, Multi=true, Displayer=function(aj) return aj.Name end, Default={} }) 
local ak=ad.Other_Items:Toggle("AutoOpenBoxes",{Title="Auto Open Boxes",Default=false,Description="automatically opens boxes if any are present in the inventory"}) 
ak:OnChanged(function(al) if not al then 
o.TerminateByIndex'AutoOpenBoxes' return end o.new('AutoOpenBoxes',function(am) while Z.Loaded and task.wait(0.5)
    do 
        local an=aj.Value; if l.GetDictionarySize(an)==0 then continue end; for ao in an 
        do 
            local ap=ao.Value; 
            local aq,ar=q.GetItemByName('box',ap); if not aq or not ar.am or ar.am<1 then continue end Q:useItem(aq,{use=ar.am}) 
        end
     end
     end)
     :Start()
     end)
      local al={};for am,an in m.Tiers 
      do 
         local ao=m.Tiers[am+1];if not ao then continue 
        
        end 
        -- auto upgrade to gold / toxic
        table.insert(al,{Name=string.format('%s -> %s', tostring(an.name), tostring(ao.name)),Value=am,AttributeName=an.attributeName})end; 
        local am=ad.Other_Combining:Dropdown("UpgradeTierDropdown",{ Title="Upgrade Tiers", Description="determines which tiers will be upgraded", Values=al, Multi=true, Displayer=function(am) 
            return am.Name end, Default={} }) 
            local an=ad.Other_Combining:Toggle("AutoUpgradeTiers",{Title="Auto Upgrade Pets",Default=false,Description="automatically upgrades pets tier based on the configuration above"}) 
            an:OnChanged(function(ao) if not ao then o.TerminateByIndex'AutoUpgradeTiers' return end o.new('AutoUpgradeTiers',function(ap) while Z.Loaded and task.wait(0.5)
                
                do 
                    local aq=am.Value; if l.GetDictionarySize(aq)==0 then 
                        continue 
                    end; for ar in aq do 
                        
                        local as=ar.Value; if(not m.Tiers[as+1])then continue end local at=q.GetPetsByTier(as); for au,av in at do if av:getLocked()then continue end if av:getAmount()<5 then continue 
                        
                        end 
                        
                        N:craft({au},true) 
                    
                    end 
                end 
                end 
            end)
            :Start()
         end)

         -- auto claim rewards (playtime/daily/achievements)
          local ao=ad.Other_Misc:Toggle("AutoClaimRewards",{Title="Auto Claim Rewards",Default=false,Description="automatically claims rewards (Playtime, Daily, Achievements)"}) 
          ao:OnChanged(function(ap) if not ap then o.TerminateByIndex'AutoClaimRewards'
            
            return 
        end
         o.new('AutoClaimRewards',function(aq) while Z.Loaded and task.wait(1)do for ar,as in m.PlaytimeRewards 
            
            do 
                if table.find(T.data.claimedPlaytimeRewards,ar)then continue end; if as.required-T.data.sessionTime>0 
                then continue end if M:claimPlaytimeReward(ar)=="success"then Z:Notify{Title="rawhead | claimed playtime reward",Content=string.format('claimed playtime reward no%s', tostring(ar)),Duration=1.5} 
                end
             end

 if(T.data.dayReset-os.time()+86400)<=0 then if M:claimDailyReward()=="success"then Z:Notify{Title="rawhead | claimed daily reward",Content="todays daily reward has been claimed",Duration=1.5} 

end 
end 

for ar,as in m.Achievements do local at,au=q.GetNextAchievementByClass(ar); if not at then continue end; if au.amount>as.getValue(T.data)then continue 
end

if M:claimAchievement(ar)=="success"then Z:Notify{Title="rawhead | claimed achievement",Content=string.format('claimed achievement %s (tier %s)', tostring(ar), tostring(at)),Duration=1.5} 
end
 end
 end
 end)
 :Start()
 end)

  local ap=ad.Other_Misc:Toggle("AutoClaimIndexRewards",{Title="Auto Claim Index Rewards",Default=false,Description="automatically claims index rewards"}); ap:OnChanged(function(aq) 
    if not aq then o.TerminateByIndex'AutoClaimIndexRewards' return end o.new('AutoClaimIndexRewards',function(ar) while Z.Loaded
         and 
         task.wait(1)do for as,at in m.IndexRewards do if table.find(T.data.claimedIndexRewards,as)then continue 
        end;
          if at.required>m.Util.indexUtils.countIndex(T.data,true)then continue 
        end 
        
        if
         O:claimIndexReward(as)=="success"then Z:Notify{Title="rawhead | claimed index reward",Content=string.format('claimed index reawrd no%s', tostring(as)),Duration=1.5} 
        
        end 
    end 
end 
end):
Start()
 end)
 
 local aq=ad.Other_Misc:Toggle("AutoPrestigeToggle",{Title="Auto Prestige",Default=false,Description="automatically prestiges when possible"});
  aq:OnChanged(function(ar) if not ar then 
    o.TerminateByIndex'AutoPrestigeToggle' return 
end 
o.new('AutoPrestigeToggle',function(as) while Z.Loaded and task.wait(1)do local at=(T.data.prestige or 0)+1; 
    local au=m.Prestiges[at]; if not au then continue end; if au.required>T.data.prestigeXp then continue end if P:claim()=="success"then Z:Notify{Title="rawhead | prestiged",Content=string.format('successfully prestiged to prestige %s', tostring(at)),Duration=1.5} 
    end
 end
 end)
 :Start()
 end)
 end
  do 
    _:SetLibrary(Z) 
    aa:SetLibrary(Z) 
    _:IgnoreThemeSettings() 
    _:SetIgnoreIndexes{} 
    aa:SetFolder"RawheadScriptHub" 
    _:SetFolder("RawheadScriptHub/"..game.PlaceId)
     aa:BuildInterfaceSection(ac.Settings) 
     _:BuildConfigSection(ac.Settings) 
     ab:SelectTab(1) 
     
     Z:Notify{ Title="Rawhead", Content="Script Loaded!, Enjoy!  <3 ", Duration=20 }
      Z:ToggleTransparency(false) 
      _:LoadAutoloadConfig() 
      Z.OnUnload:Connect(function() 
        o.TerminateAll() 
        local ae=C(z,'UIToggle') 
        if ae then ae:Destroy()
        end; 
    end) 
           do
             o.new('DiscordJoinPrompt',function(ae) local af=120 while true do local ag,ah=pcall(isfile,'Rawhead Discord Server');
                if ag and ah==true then break end; task.wait(af) af=af*3 local ai=ab:Dialog
                { Title="Discord", Content="Hey! Want to join our Discord for more scripts and updates?",
                 Buttons=  { { Title="Sure", Callback=function()r.PromptDiscordJoin('ECwtjqzA',true)pcall(writefile,'Rawhead Discord Server','true')end }, 
                { Title="No", Callback=function()end } } } ai.Closed:Wait() end o.TerminateByIdentifier(ae.Identifier)
            
            
             end)
             
             :Start() 
            end
             r.AntiAFK(true) 
            end 
        end,
        
        Properties={ Name="Init" }, Reference=1, 
        Children={ { ClassName="ModuleScript", Closure=function()
            local a={Cache=setmetatable({},
            {__index=function(a,aa)rawset(a,aa,{})return rawget(a,aa)end,})} 
            function a.SetupLazyLoader(aa,ab)
             local ac={}; for ad,ae in aa:GetChildren()do ac[ae.Name]=ae 
            
            end 
            
            setmetatable(ab,{ __index=function(ad,ae)
                 local af=ac[ae]; assert(af,string.format('[Library]: Cannot find module %s in %s',ae,script.Name)) 
                 local ag,ah=pcall(require,af) assert(ag,string.format('[Library]: Failed to Initalize Module %s in %s: %s',ae,script.Name,tostring(ah)))
                 
                 assert(typeof(ah)=='function',string.format('[Library]: Module %s is NOT a Function',ae)) 
                    local ai,aj=pcall(ah,a) assert(ai,string.format('[Library]: Failed to Load Module %s in %s: %s',ae,script.Name,tostring(aj)))
                     rawset(ad,ae,aj) return aj end, })
                    
                    end 
                    
                    a.SetupLazyLoader(script,a) 
                    return a 
                
                end, Properties={ Name="Library" }, Reference=2, Children={ { ClassName="ModuleScript", Closure=function()return function(a) 
                    local aa={}; a.SetupLazyLoader(script,aa) return aa 
                end 
            end, 
            Properties={ Name="Functions" }, Reference=3, Children={ { ClassName="ModuleScript", Closure=function()return function(a)
                 local aa={}; a.SetupLazyLoader(script,aa) 
                 return aa 
                end 
            end, 
            Properties={ Name="Generic" }, Reference=4, Children={ { Closure=function()return function(a) 
                local aa=a.Services local ab=aa.Stats local ac=ab.Network.ServerStatsItem["Data Ping"] 
                local ad=ac.GetValue return function()local ae, af=pcall(ad,ac);
                     return af or 0 
                    end 
                end 
            end, 
            Properties={ Name="GetPing" }, Reference=26, ClassName="ModuleScript" }, { Closure=function()return function(a)
                 local aa={} return function(ab) 
                    local ac=tostring(ab); if aa[ac]then return aa[ac]end
                     local ad=ac:reverse():gsub("%d%d%d","%1,"):reverse():gsub("^,",""); aa[ac]=ad return ad end end end, Properties={ Name="CommaNumber" }, 
                     Reference=23, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Services 
                        local ab=aa.Players 
                        local ac=aa.Workspace 
                        local ad=ab.LocalPlayer return function(ae,af) 
                            local ai=ad.Character; if(not ai)then return false end af=af or{}; 
                            local aj=af.From or workspace.CurrentCamera.CFrame.Position 
                            local ak=(ae.Position-aj).Unit; 
                            local al=RaycastParams.new(); al:AddToFilter(ad.Character)
                             al.FilterType=Enum.RaycastFilterType.Exclude for am,an in af.Ignore or{}do al:AddToFilter(an) 
                            end 
                            local am=ac:Raycast(aj,ak*1000,al); if am then 
                                local an=am.Instance; if an and((am.Instance==ae)or(af.ParentMatching and am.Instance.Parent==ae.Parent))
                                then return true 
                                end 
                            end 
                            return 
                            false 
                        end 
                    end 
                end, 
                Properties={ Name="IsPartVisible" }, Reference=27, ClassName="ModuleScript" }, { Closure=function()return function(a) 
                    local aa={}; return function(ab) 
                        local ac=aa[tostring(ab)]; if ac then return ac end 
                        local ad=(ab-ab%60)/60 ab=ab-ad*60 local ae=(ad-ad%60)/60 ad=ad-ae*60 
                        local af=string.format("%02i",ae)..":"..string.format("%02i",ad)..":"..string.format("%02i",ab) aa[tostring(ab)]=af return af 
                    end 
                end 
            end, Properties={ Name="FormatHms" }, Reference=18, ClassName="ModuleScript" }, { Closure=function() return function(a) 
                local aa=a.Functions.Generic.HttpRequest 
                local ab=a.Services 
                local ac=ab.HttpService return function(ad,ae) if ae then setclipboard("https://www.discord.gg/"..ad) 
                end 
                if(not aa)then return false end aa{ Url="http://127.0.0.1:6463/rpc?v=1", Method="POST", Headers={ ["Content-Type"]="application/json",Origin= "https://discord.com" }, Body=ac:JSONEncode{ cmd="INVITE_BROWSER", args={ code=ad }, nonce=ac:GenerateGUID(false) } } return true end end end, Properties={ Name="PromptDiscordJoin" }, Reference=25, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(aa,ab,ac,ad) 
                    local ae=ab or 3 
                    local af=ac or 1 
                    local ai=ad or{} 
                    local aj=0; while aj<ae do 
                        local ak,al=pcall(aa,unpack(ai)) if ak and al then return true
                         end 
                         aj=aj+af;task.wait(af) end return false 
                        end 
                    end 
                end, 
                Properties={ Name="Timeout" }, Reference=22, ClassName="ModuleScript" }, { Closure=function()return function(a) 
                    local aa={ Info='🔵', Warn='🟠', Success='🟢', Error='🔴' } 
                    local function ab(ac,ad) 
                        local ae=os.date"*t" string.format("%s:%s:%s",ae.hour,ae.min,ae.sec) 
                        print(string.format("%s | [Library]: %s",aa[ac],ad)) 
                    end return ab 
                end 
            end, 
            
            Properties={ Name="OutputMessage" }, Reference=30, ClassName="ModuleScript" }, { Closure=function()return function(a) 
                local aa; 
                local ab=a.Services 
                local ac=ab.VirtualUser 
                local ad=ab.Players 
                local ae=Random.new() 
                local af=ad.LocalPlayer 
                local ai=ac.Button2Down 
                local aj=ac.Button2Up 
                return function(ak) 
                    if ak==false then if aa 
                        then aa:Disconnect()end;
                         return true end 
                         if aa then return true 
                        end 
                         
                         aa=af.Idled:Connect(function() 
                            local al=workspace.CurrentCamera ai(ac,Vector2.new(0,0),al.CFrame) 
                            task.wait(ae:NextNumber(0,1)) aj(ac,Vector2.new(0,0),al.CFrame) 
                        end)
                     end
                     end
                     end,
                      Properties={ Name="AntiAFK" }, Reference=19, ClassName="ModuleScript" },
                       { Closure=function()return function(a) return(syn and syn.request)or(http and http.request)or httprequest or request or function()return 
                    end 
                end 
            end, 
            Properties={ Name="HttpRequest" }, Reference=24, ClassName="ModuleScript" }, { Closure=function()return function(a)
                 local aa=a.Cache.Actions; return function(ab) for ac,ad in ab do local ae=aa[ad]; if ae then return false end end return true 
                end 
            end 
        end, 
        Properties={ Name="GetActionState" }, Reference=35, ClassName="ModuleScript" }, 
        { Closure=function()return function(a) local aa=a.Services 
            local ab=aa.GuiService return function() 
            local ac=workspace.CurrentCamera local ad=ac.ViewportSize 
            local ae,af=ab:GetGuiInset() return Vector2.new(ad.X,ad.Y),ae,af 
        end 
    end 
end, 
Properties={ Name="GetScreenSize" }, Reference=29, ClassName="ModuleScript" }, 
{ Closure=function()return function(a) 
    local aa=game.FindFirstChild return function(ab) 
        local ac=ab.Character if(not ac)then return false end
         local ad=ac.PrimaryPart if(not ad)then return false end 
         local ae=aa(ac,"Humanoid") if(not ae)or(ae.Health<=0)then 
            return false end return ac 
        end 
    end 
end, 
Properties={ Name="IsAlive" }, Reference=20, ClassName="ModuleScript" }, { Closure=function()return function(a)
     local aa=a.Services 
     local ab=a.Libraries.RBXUtil.Trove 
     local ac=Drawing; 
     local ad=aa.RunService return function(ae,af,ai) if(not ac)then return end 
     local aj=ab.new(); local ak=aj:Add(ac.new(ae),'Destroy'); for al,am in af do ak[al]=am end aj:Add(ad.Heartbeat:Connect(function(al) ai(ak,al,aj) end)) 
     return aj 
    end 
end 
end, 
Properties={ Name="SmartDraw" }, Reference=36, ClassName="ModuleScript" }, 
{ Closure=function()return function(a) return function(aa,ab) 
    local ac=Instance.new(aa); for ad,ae in ab do ac[ad]=ae end return ac 
end 
end 
end, 
    
    Properties={ Name="CreateInstance" }, Reference=28, ClassName="ModuleScript" }, 
    { Closure=function()return function(a) 
        local aa=a.Cache.Actions; return function(ab,ac) for ad,ae in ab do aa[ae]=ac 
        end 
        return true 
    end 
end 
end,
 Properties={ Name="SetActionState" }, Reference=34, ClassName="ModuleScript" }, 
 { Closure=function()return function(a) local aa=a.Cache.ScriptCache return function()
     local ab=aa.InitTime if(not ab)then return 0 end return DateTime.now().UnixTimestamp-ab 
    end 
end 
end, 
Properties={ Name="GetUptime" }, Reference=17, ClassName="ModuleScript" }, 
{ Closure=function()return function(a) 
    local aa=a.Functions.Generic.GetPing; 
    return function(ab,ac) local ad=aa(); if ad<ab then return end while aa()>ac do task.wait(0.2) 
    end 
end 
end
 end, 
 Properties={ Name="HaltLatency" }, Reference=16, ClassName="ModuleScript" }, 
 { Closure=function()return function(a) 
    local aa=a.Services 
    local ab=aa.Players 
    local ac=ab.LocalPlayer 
    local ad=ac:GetMouse() return function() return Vector2.new(ad.X,ad.Y) 
    end 
end 
end,
Properties={ Name="GetMousePosition" }, Reference=33, ClassName="ModuleScript" }, 
{ Closure=function()return function(a) return function(aa,ab) 
    local ac=ab.Retries or 2; 
    local ad=ab.Arguments or{}; 
    local ae=ab.RetryDelay or 0; 
    local af,ai; for aj=1,ac do af,ai=pcall(aa,unpack(ad)); 
        if af and ai==true then break end task.wait(ae) 
    end 
    return af,ai 
end 
end 
end, 
Properties={ Name="Retry" }, Reference=31, ClassName="ModuleScript" }, 
{ ClassName="ModuleScript", Closure=function()return function(a) 
    local aa=game.FindFirstChild 
    local ab={}; local ac={}; 
    local function ad(ae,af) 
        local ai=(not af and ab[ae]); if ai then return ai end; local aj=ac[ae] 
        local ak=(aj or(select(2,pcall(require(ae),a)))) 
        local al=typeof(ak)=='function' if(not aj and al)then ac[ae]=ak end 
        local am=(al and select(2,pcall(ak))); ab[ae]=am return am end return function(ae,af,ai,aj) 
            local ak={}; local al={ [true]=af, [false]=ai } for am,an in ae do local ao=aa(script,an) if(not ao)then continue end 
            local ap=ad(ao,aj); if(not ap)then table.insert(ak,an)end; end local am=#ak==0 if al[am]then pcall(al[am],ak) end return am,ak end end end, 
            Properties={ Name="AssertFunctions" }, Reference=5, Children={ { Closure=function()return function(a) 
                local function aa() local ab="Constant" 
                    return ab end return function() 
                        local ab=(debug and debug.getconstants)or getconstants if not ab then return false 
                        end 
                        local ac,ad=pcall(ab,aa) if not ac or(typeof(ad)~='table')or#ad~=1 or ad[1]~='Constant'then return false end return true 
                    end 
                end 
            end, 
            Properties={ Name="getconstants" }, Reference=7, ClassName="ModuleScript" }, 
            { Closure=function()return function(a)
                 local aa=setmetatable({},{}) 
                local ab=setmetatable({},{__metatable="locked"}) 
                local ac=getmetatable(aa) return function(ad)
                     local ae=getrawmetatable if not ae then return false end 
                     local af,ai=pcall(ae,aa); if(not af)or ai~=ac then return false end 
                     local aj,ak=pcall(ae,ab); if(not aj)or(ak.__metatable~='locked')then return false end return true end end end, 
                     Properties={ Name="getrawmetatable" }, Reference=8, ClassName="ModuleScript" }, 
                     { Closure=function()return function(a) 
                        local aa=function() return false end return function() 
                            local ab=hookfunction; if not ab then return false end 
                            local ac,ad=pcall(ab,aa,function()return true end); if not ac then return false end 
                            local ae,aj=pcall(aa); if not ae or aj~=true then return false end ab(aa,ad) return true 
                        end 
                    end 
                end, 
                Properties={ Name="hookfunction" }, Reference=15, ClassName="ModuleScript" }, 
                { Closure=function()return function(a) local aa={1,2,3,'Hi','Test'} 
                    local function ab() local ad,ae,aj,ak=table.unpack(aa) return table.pack(ad,ae,aj,ak) end return function() 
                        local ad=debug and debug.getupvalues or getupvalues; if(not ad)then return false 
                        end 
                        local ae,aj=pcall(ad,ab) if not ae or typeof(aj)~='table'or typeof(aj[1])~='table'or(table.unpack(aj[1])~=table.unpack(aa))then 
                            return 
                            false end return true 
                        end 
                    end 
                end, 
                Properties={ Name="getupvalues" }, Reference=10, ClassName="ModuleScript" }, 
                { Closure=function()return function(a) 
                    local function aa(ab) return(pcall(function() 
                        return(ab.Radius and ab.Color and ab.NumSides and ab.Position and ab.Transparency and typeof(ab.Destroy)=='function') end)) 
                    
                    end 
                    return function() 
                        local ab=Drawing; if(not ab)or(not ab.new)then return false
                         end 
                        local ad,ae=pcall(ab.new,'Circle'); if(not ad)or(not aa(ae))then return false end 
                        local aj, ak=pcall(ae.Destroy,ae) if(not aj)then return false end return true 
                    end 
                end 
            end, 
            Properties={ Name="drawing" }, Reference=13, ClassName="ModuleScript" }, { Closure=function()return function(a) 
                local aa={ Param={ Function=function(aa,ab,aj,ak)local al=5;return al end,
                Expected={source="=";what="Lua";numparams=4;func=nil;short_src="";name="Function";is_vararg=0;nups=0;} },
                 Lua={ Function=function()return'Hi i am lua indeed'end, 
                 Expected={source="=";what="Lua";numparams=0;func=nil;short_src="";name="Function";is_vararg=0;nups=0;} }, 
                 C={ Function=print or function()return'well this aint no C'end, Expected={source="=[C]";what="C";numparams=0;func=nil;short_src="[C]";currentline=-1;name="print";is_vararg=1;nups=0;} } } 
                 return function() local ab=(debug and debug.getinfo)or getinfo if not ab then return false end for aj,ak in aa 
                 do ak.Expected.func=ak.Function; local al,am=pcall(ab,ak.Function); if not al or(typeof(am)~='table')
                    then return false end for an,ao in ak.Expected do if(am[an]==ao)then continue end return false
                 end 
                end 
                return 
                true 
            end 
        end 
    end, 
    Properties={ Name="debug_getinfo" }, Reference=6, ClassName="ModuleScript" }, { Closure=function()return function(a) local function aa() 
        return nil end return function() 
            local ab=newcclosure if not ab then return false end 
            local aj,ak=pcall(ab,aa) if not aj or typeof(ak)~="function"or ak==aa then return false end return true end end end, 
            Properties={ Name="newcclosure" }, Reference=11, ClassName="ModuleScript" }, { Closure=function()return function(a) 
                local aa=a.Functions.Generic.CreateInstance 
                local ab=a.Libraries.Generic.Services 
                local aj=a.Libraries.Generic.Trove local ak= ab.RunService local al=ab.Workspace 
                local am=ab.Players local an=am.LocalPlayer 
                local function ao() return aa("Part",{ Parent=al, Size=Vector3.zero, Anchored=true, CanCollide=false, Transparency=1 }) end 
                local ap=game.WaitForChild return function() local aq=firetouchinterest if not aq then return false end 
                local ar=aj.new(); local as=ar:Add(ao()) local at=an.Character or an.CharacterAdded:Wait(); local au=ap(at,'HumanoidRootPart',10) if(not au)then ar:Destroy()return false end local av,aw=false,0 ar:Add(as.Touched:Once(function() av=true end))local ax, ay=pcall(aq,as,au,0); if(not ax)then ar:Destroy(); return false end while(aw<0.5 and not av)do aw=aw+task.wait() end ar:Destroy(); return av end end end, Properties={ Name="firetouchinterest" }, Reference=14, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=setmetatable({},{ __index=function(aa,ab) return false end, }) local function ab(aj,ak) return aj[ak] end return function() local aj=hookmetamethod; if(not aj)then return false end local ak, al=pcall(aj,aa,"__index",function()return true end); if(not ak)then return false end local am,an=pcall(ab,aa,'Test'); if(not am)or an~=true then return false end return true end end end, Properties={ Name="hookmetamethod" }, Reference=12, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=function()return end; return function() local ab=islclosure if not ab then return false end local aj,am=pcall(ab,aa); if not aj or am~=true then return false end local an=print; if(not an)then return false end local ao,ap=pcall(ab,an); if not ao or ap==true then return false end return true end end end, Properties={ Name="islclosure" }, Reference=9, ClassName="ModuleScript" } } }, { Closure=function()return function(a) local aa=a.Functions.Generic.OutputMessage return function(ab,an) local ao=os.clock(); return function() local ap=math.ceil((os.clock()-ao)*1000); local aq=an or 250 if ap>aq and a.Debug then aa('Warn',string.format('%s Benchmark took long to complete (%sms) (Expected: %sms)', tostring(ab), tostring(ap), tostring(aq))) end return ap end end end end, Properties={ Name="Benchmark" }, Reference=32, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Services local ab=aa.Players local an=ab.LocalPlayer return function(ao) local ap=an.Character; if(not ap)or(not ap.HumanoidRootPart)then return end ap.HumanoidRootPart.Anchored=ao end end end, Properties={ Name="SetPlayerAnchored" }, Reference=21, ClassName="ModuleScript" } } }, { ClassName="ModuleScript", Closure=function()return function(a) local aa={}; a.SetupLazyLoader(script,aa) return aa end end, Properties={ Name="Special" }, Reference=37, Children={ { Closure=function()return function(a) local aa=a.Libraries local ab=aa.Special.GameModules.Get(); local an=ab.Knit local ao=an.GetController'DataController' local ap=ab.Rebirths local aq=ab.Upgrades return function() local ar; local as=aq.rebirthButtons.upgrades[ao.data.upgrades.rebirthButtons or 0]; for at,au in ap do if as.value>=at then ar=at continue end break end return ar end end end, Properties={ Name="GetBestRebirthOption" }, Reference=39, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Libraries.Special.GameModules.Get(); local ab=aa.Knit.GetController'DataController'; local an=aa.Items local ao=an.pet return function(ap) local aq={}; for ar,as in ab.data.inventory.pet do local at=ao(as.nm):setData(as); if at:getTier()==ap then aq[ar]=at end end return aq end end end, Properties={ Name="GetPetsByTier" }, Reference=42, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Libraries.Special.GameModules.Get() local ab=aa.Knit.GetController'DataController'; return function(an,ao) for ap,aq in ab.data.inventory[an]do if aq.nm==ao then return ap,aq end end return nil end end end, Properties={ Name="GetItemByName" }, Reference=44, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Libraries local ab=aa.Special.GameModules.Get(); local an=ab.Knit local ao=an.GetController'DataController' local ap=ab.Rebirths local aq=ab.Variables return function(ar) local as=ap[ar]; if not as then return false end local at=ao.data.clicks; return at>=(aq.rebirthPrice+ao.data.rebirths*aq.rebirthPriceMultiplier)*as+aq.rebirthPriceMultiplier*(as*(as-1)/2) end end end, Properties={ Name="CanAffordRebirth" }, Reference=40, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Libraries.Special.GameModules.Get() local ab=aa.Knit.GetController'DataController'; local an=aa.Achievements return function(ao) for ap,aq in an[ao].list do if ab.data.claimedAchievements[string.format('%s%s', tostring(ao), tostring(ap))]then continue end; return ap,aq end return nil end end end, Properties={ Name="GetNextAchievementByClass" }, Reference=43, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Libraries local ab=aa.Special.GameModules.Get(); local an=ab.Knit local ao=an.GetController'DataController' local ap=ab.Rebirths local aq=ab.Upgrades return function() local ar={} local as=aq.rebirthButtons.upgrades[ao.data.upgrades.rebirthButtons or 0]; for at,au in ap do if as.value<at then continue end table.insert(ar,au) end return ar end end end, Properties={ Name="GetUnlockedRebirthOptions" }, Reference=38, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Services local ab=aa.CollectionService; local an=game.FindFirstChildWhichIsA return function(ao) local ap={}; for aq,ar in ab:GetTagged'Tree'do local as=an(ar,'Model'); if not as then continue end local at=ar:GetAttribute'groupId'; if at~=ao then continue end local au=ar:GetAttribute'treeId' local av=ar:GetAttribute'currentId' if not au or not av then continue end table.insert(ap,{ Id=au, TreeType=av, CFrame=as:GetPivot() }) end return ap end end end, Properties={ Name="GetTreesByGroupId" }, Reference=41, ClassName="ModuleScript" } } } } }, { ClassName="ModuleScript", Closure=function()return function(a) local aa={}; a.SetupLazyLoader(script,aa) return aa end end, Properties={ Name="Libraries" }, Reference=45, Children={ { ClassName="ModuleScript", Closure=function()return function(a) local aa={}; a.SetupLazyLoader(script,aa) return aa end end, Properties={ Name="Generic" }, Reference=46, Children={ { ClassName="ModuleScript", Closure=function()return function(a) local aa=iscclosure local ab=newcclosure local an=a.Libraries.RBXUtil.Trove local ao=a.Services local ap=require(script.Metatable)(a) local aq=ao.HttpService local ar={} ar.Settings={CanStart=true} ar.List={} function ar.new(as,at) local au=aq:GenerateGUID(false) local av=setmetatable({ Running=false, Terminated=false, Index=as, Trove=an.new(), Identifier=au, Thread=at and((aa(at)and at)or(ab(at)))or nil, Creation=DateTime.now().UnixTimestamp },ap) ar.List[au]=av return av end function ar.GetByIndex(as) local at={}; for au,av in ar.List do if av.Index~=as then continue end table.insert(at,av) end if#at==0 then return false end return at end function ar.TerminateByIndex(as) for at,au in ar.List do if au.Index~=as then continue end au:_terminate() ar.List[at]=nil end end function ar.GetByIdentifier(as) return ar.List[as]or nil end function ar.TerminateByIdentifier(as) local at=ar.GetByIdentifier(as); if at then at:_terminate() ar.List[as]=nil end end function ar.TerminateAll() for as,at in ar.List do at:_terminate() ar.List[as]=nil end end function ar.SetOption(as,at) ar.Settings[as]=at end return ar end end, Properties={ Name="Threading" }, Reference=48, Children={ { Closure=function()return function(a) local aa=a.Functions.Generic.OutputMessage local ab={} ab.__index=ab function ab.Start(an,...) if an.Running or an.Terminated or(not an.Thread)then return an end an.Running=true local ao,ap=pcall(task.spawn,an.Thread,an,...); if not ao or typeof(ap)~='thread'then aa('Error',string.format('Failed to start thread %s: %s', tostring(an.Index), tostring(tostring(ap)))) return an end an.Trove:Add(ap) return an end function ab._terminate(an) if an.Terminated then return an end an.Running=false an.Terminated=true an.Trove:Destroy() return an end function ab.Add(an,ao,ap) if(an.Terminated)or(not an.Running)then return an end local aq,ar=pcall(an.Trove.Add,an.Trove,ao,ap); if not aq then aa('Error',string.format('Failed to add object %s to Thread %s: %s', tostring(tostring(ao)), tostring(an.Index), tostring(tostring(ar)))) end return an end function ab.GetAge(an) return(DateTime.now().UnixTimestamp-an.Creation) end return ab end end, Properties={ Name="Metatable" }, Reference=49, ClassName="ModuleScript" } } }, { Closure=function()return function(a) local aa=a.Libraries.RBXUtil local ab=a.Functions.Generic local an=aa.Promise local ao=aa.TableUtil local ap=aa.Signal local aq=ab.OutputMessage local ar=ab.Benchmark local as=ao.GetDictionarySize local at={Fluent= { Id=97404758083545, Expected=1500 },SaveManager= { Id=132828910264093, Expected=1200 },ThemeManager= { Id=72525158718178, Expected=1200 } }; local au={ Cached=false, Caching=false, OnCached=ap.new(), Cache={} } local av=function() local av=ar('Interface',8000) au.Caching=true local aw={} for ax,ay in at do table.insert(aw,an.new(function(az,b) local c=ar(string.format('Interface/%s', tostring(ax)),ay.Expected) local d,e=pcall(game.GetObjects,game,string.format('rbxassetid://%s', tostring(ay.Id))) if d then if a.Debug then aq('Success',string.format('Successfully loaded Interface Module %s: %sms Elapsed', tostring(ax), tostring(c()))) end az(loadstring(e[1].Source)()) else b(tostring(e)) end end):andThen(function(az) au.Cache[ax]=az end):catch(function(az) aq('Error',string.format('Failed to load Interface Module %s: %s', tostring(ax), tostring(az))) end)) end an.all(aw):await() if a.Debug then aq('Info',string.format('Took %sms to load Interface Class (%s Modules)', tostring(av()), tostring(as(at)))) end au.Cached=true au.Caching=false au.OnCached:Fire(au.Cache) return au.Cache end return{ Get=function() if au.Cached==false then if au.Caching==true then return au.OnCached:Wait()end return av() end return au.Cache end, } end end, Properties={ Name="Interface" }, Reference=47, ClassName="ModuleScript" } } }, { ClassName="ModuleScript", Closure=function()return function(a) local aa={}; a.SetupLazyLoader(script,aa) return aa end end, Properties={ Name="Special" }, Reference=50, Children={ { Closure=function()return function(a) local aa=a.Services local ab=a.Libraries.RBXUtil local an=a.Functions.Generic local ao=aa.ReplicatedStorage local ap=aa.Players local aq=ab.Promise local ar=ab.Tree local as= ab.TableUtil local at=ab.Signal local au=an.OutputMessage local av={ Caching=false, Cached=false, Cache={}, OnCached=at.new() } local function aw() local ax=ap.LocalPlayer local ay= ax.Character local az={ Knit=ar.Find(ao,'Packages/Knit'), Upgrades=ar.Find(ao,'Shared/List/Upgrades'), Rebirths=ar.Find(ao,'Shared/List/Rebirths'), Functions=ar.Find(ao,'Shared/Functions'), Variables=ar.Find(ao,'Shared/Variables'), Eggs=ar.Find(ao,'Shared/List/Pets/Eggs'), Values=ar.Find(ao,'Shared/Values'), Util=ar.Find(ao,'Shared/Util'), Farms=ar.Find(ao,'Shared/List/Farms'), Trees=ar.Find(ao,'Shared/List/Trees'), Chests=ar.Find(ao,'Shared/List/Chests'), Tiers=ar.Find(ao,'Shared/List/Pets/Tiers'), Items=ar.Find(ao,'Shared/Items'), PlaytimeRewards=ar.Find(ao,'Shared/List/PlaytimeRewards'), Achievements=ar.Find(ao,'Shared/List/Achievements'), IndexRewards=ar.Find(ao,'Shared/List/IndexRewards'), Prestiges=ar.Find(ao,'Shared/List/Prestige/Prestiges'), Potions=ar.Find(ao,'Shared/List/Items/Potions'), Boxes=ar.Find(ao,'Shared/List/Items/Boxes'), } return az end local function ax() local ay={} av.Caching=true for az,b in aw()do table.insert(ay,aq.new(function(c,d) local e,f=pcall(require,b); if e then c(f) else d(tostring(f)) end end):andThen(function(c)av.Cache[az]=c end):catch(function(c) au('Error',string.format('Failed to require Game Module %s: %s', tostring(b.Name), tostring(c))) end)) end aq.all(ay):await() av.Caching=false av.Cached=true av.OnCached:Fire(av.Cache) return av.Cache end local function ay() if av.Cached==false then if av.Caching==true then return av.OnCached:Wait()end return ax() end return av.Cache end return table.freeze{ Get=ay } end end, Properties={ Name="GameModules" }, Reference=51, ClassName="ModuleScript" } } }, { ClassName="ModuleScript", Closure=function()return function(a) local aa={}; a.SetupLazyLoader(script,aa) return aa end end, Properties={ Name="RBXUtil" }, Reference=52, Children={ { Closure=function()return function(a) local aa local function ab(an,...) local ao=aa aa=nil an(...) aa=ao end local function an(...) ab(...) while true do ab(coroutine.yield()) end end local ao={} ao.__index=ao function ao.Disconnect(ap) if not ap.Connected then return end ap.Connected=false if ap._signal._handlerListHead==ap then ap._signal._handlerListHead=ap._next else local aq=ap._signal._handlerListHead while aq and aq._next~=ap do aq=aq._next end if aq then aq._next=ap._next end end end ao.Destroy=ao.Disconnect setmetatable(ao,{ __index=function(ap,aq) error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(aq)),2) end, __newindex=function(ap,aq,ar) error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(aq)),2) end, }) local aq={} aq.__index=aq function aq.new() return setmetatable({_handlerListHead=false,_proxyHandler=nil,_yieldedThreads=nil},aq) end function aq.Wrap(ar) assert(typeof(ar)=="RBXScriptSignal","Argument #1 to Signal.Wrap must be a RBXScriptSignal; got "..typeof(ar)) local as=aq.new() as._proxyHandler=ar:Connect(function(...)as:Fire(...)end) return as end function aq.Is(ar) return type(ar)=="table"and getmetatable(ar)==aq end function aq.Connect(ar,as) local at=setmetatable({Connected=true,_signal=ar,_fn=as,_next=false},ao) if ar._handlerListHead then at._next=ar._handlerListHead ar._handlerListHead=at else ar._handlerListHead=at end return at end function aq.ConnectOnce(ar,as)return ar:Once(as)end function aq.Once(ar,as) local at local au=false at=ar:Connect(function(...) if au then return end au=true at:Disconnect() as(...) end) return at end function aq.GetConnections(ar) local as={} local at=ar._handlerListHead while at do table.insert(as,at) at=at._next end return as end function aq.DisconnectAll(ar) local as=ar._handlerListHead while as do as.Connected=false as=as._next end ar._handlerListHead=false local at=rawget(ar,"_yieldedThreads") if at then for au in at do if coroutine.status(au)=="suspended"then warn(debug.traceback(au,"signal disconnected; yielded thread cancelled",2)) task.cancel(au) end end table.clear(ar._yieldedThreads) end end function aq.Fire(ar,...) local as=ar._handlerListHead while as do if as.Connected then if not aa then aa=coroutine.create(an) end task.spawn(aa,as._fn,...) end as=as._next end end function aq.FireDeferred(ar,...) local as=ar._handlerListHead while as do local at=as task.defer(function(...) if at.Connected then at._fn(...)end end,...) as=as._next end end function aq.Wait(ar) local as=rawget(ar,"_yieldedThreads") if not as then as={} rawset(ar,"_yieldedThreads",as) end local at=coroutine.running() as[at]=true ar:Once(function(...) as[at]=nil task.spawn(at,...) end) return coroutine.yield() end function aq.Destroy(ar) ar:DisconnectAll() local as=rawget(ar,"_proxyHandler") if as then as:Disconnect()end end setmetatable(aq,{ __index=function(ar,as) error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(as)),2) end, __newindex=function(ar,as,at) error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(as)),2) end, }) return table.freeze{new=aq.new,Wrap=aq.Wrap,Is=aq.Is} end end, Properties={ Name="Signal" }, Reference=55, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa="Non-promise value passed into %s at index %s" local ab="Please pass a list of promises to %s" local an="Please pass a handler function to %s!" local ao={__mode="k"} local function aq(as) if type(as)=="function"then return true end if type(as)=="table"then local at=getmetatable(as) if at and type(rawget(at,"__call"))=="function"then return true end end return false end local function as(at,au) local av={} for aw,ax in ipairs(au)do av[ax]=ax end return setmetatable(av,{ __index=function(aw,ax) error(string.format("%s is not in %s!",ax,at),2) end, __newindex=function() error(string.format("Creating new members in %s is not allowed!",at),2) end, }) end local at do at={ Kind=as("Promise.Error.Kind",{ "ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut", }), } at.__index=at function at.new(au,av) au=au or{} return setmetatable({ error=tostring(au.error)or"[This error has no error text.]", trace=au.trace, context=au.context, kind=au.kind, parent=av, createdTick=os.clock(), createdTrace=debug.traceback(), },at) end function at.is(au) if type(au)=="table"then local av=getmetatable(au) if type(av)=="table"then return rawget(au,"error")~=nil and type(rawget(av,"extend"))=="function" end end return false end function at.isKind(au,av) assert(av~=nil,"Argument #2 to Promise.Error.isKind must not be nil") return at.is(au)and au.kind==av end function at.extend(au,av) av=av or{} av.kind=av.kind or au.kind return at.new(av,au) end function at.getErrorChain(au) local av={au} while av[#av].parent do table.insert(av,av[#av].parent) end return av end function at.__tostring(au) local av={ string.format("-- Promise.Error(%s) --",au.kind or"?"), } for aw,ax in ipairs(au:getErrorChain())do table.insert( av, table.concat({ ax.trace or ax.error, ax.context, },"\n") ) end return table.concat(av,"\n") end end local function au(...) return select("#",...),{...} end local function av(aw,...) return aw,select("#",...),{...} end local function aw(ax) assert(ax~=nil,"traceback is nil") return function(ay) if type(ay)=="table"then return ay end return at.new{ error=ay, kind=at.Kind.ExecutionError, trace=debug.traceback(tostring(ay),2), context="Promise created at:\n\n"..ax, } end end local function ax(ay,az,...) return av(xpcall(az,aw(ay),...)) end local function ay(az,b,c,d) return function(...) local e,f,g=ax(az,b,...) if e then c(unpack(g,1,f)) else d(g[1]) end end end local function az(b) return next(b)==nil end local b={ Error=at, Status=as("Promise.Status",{"Started","Resolved","Rejected","Cancelled"}), _getTime=os.clock, _timeEvent=game:GetService"RunService".Heartbeat, _unhandledRejectionCallbacks={}, } b.prototype={} b.__index=b.prototype function b._new(c,d,e) if e~=nil and not b.is(e)then error("Argument #2 to Promise.new must be a promise or nil",2) end local f={ _thread=nil, _source=c, _status=b.Status.Started, _values=nil, _valuesLength=-1, _unhandledRejection=true, _queuedResolve={}, _queuedReject={}, _queuedFinally={}, _cancellationHook=nil, _parent=e, _consumers=setmetatable({},ao), } if e and e._status==b.Status.Started then e._consumers[f]=true end setmetatable(f,b) local function g(...) f:_resolve(...) end local function i(...) f:_reject(...) end local function l(m) if m then if f._status==b.Status.Cancelled then m() else f._cancellationHook=m end end return f._status==b.Status.Cancelled end f._thread=coroutine.create(function()local m, n, o=ax(f._source,d,g,i,l) if not m then i(o[1]) end end) task.spawn(f._thread) return f end function b.new(c) return b._new(debug.traceback(nil,2),c) end function b.__tostring(c) return string.format("Promise(%s)",c._status) end function b.defer(c) local d=debug.traceback(nil,2) local e e=b._new(d,function(f,g,i) local l l=b._timeEvent:Connect(function() l:Disconnect()local m, n, o=ax(d,c,f,g,i) if not m then g(o[1]) end end) end) return e end b.async=b.defer function b.resolve(...) local c,d=au(...) return b._new(debug.traceback(nil,2),function(e) e(unpack(d,1,c)) end) end function b.reject(...) local c,d=au(...) return b._new(debug.traceback(nil,2),function(e,f) f(unpack(d,1,c)) end) end function b._try(c,d,...) local e,f=au(...) return b._new(c,function(g) g(d(unpack(f,1,e))) end) end function b.try(c,...) return b._try(debug.traceback(nil,2),c,...) end function b._all(c,d,e) if type(d)~="table"then error(string.format(ab,"Promise.all"),3) end for f,g in pairs(d)do if not b.is(g)then error(string.format(aa,"Promise.all",tostring(f)),3) end end if#d==0 or e==0 then return b.resolve{} end return b._new(c,function(f,g,i) local l={} local m={} local n=0 local o=0 local p=false local function q() for r,s in ipairs(m)do s:cancel() end end local function r(s,...) if p then return end n=n+1 if e==nil then l[s]=... else l[n]=... end if n>=(e or#d)then p=true f(l) q() end end i(q) for s,t in ipairs(d)do m[s]=t:andThen(function(...) r(s,...) end,function(...) o=o+1 if e==nil or#d-o<e then q() p=true g(...) end end) end if p then q() end end) end function b.all(c) return b._all(debug.traceback(nil,2),c) end function b.fold(c,d,e) assert(type(c)=="table","Bad argument #1 to Promise.fold: must be a table") assert(aq(d),"Bad argument #2 to Promise.fold: must be a function") local f=b.resolve(e) return b.each(c,function(g,i) f=f:andThen(function(l) return d(l,g,i) end) end):andThen(function() return f end) end function b.some(c,d) assert(type(d)=="number","Bad argument #2 to Promise.some: must be a number") return b._all(debug.traceback(nil,2),c,d) end function b.any(c) return b._all(debug.traceback(nil,2),c,1):andThen(function(d) return d[1] end) end function b.allSettled(c) if type(c)~="table"then error(string.format(ab,"Promise.allSettled"),2) end for d,e in pairs(c)do if not b.is(e)then error(string.format(aa,"Promise.allSettled",tostring(d)),2) end end if#c==0 then return b.resolve{} end return b._new(debug.traceback(nil,2),function(d,e,f) local g={} local i={} local l=0 local function m(n,...) l=l+1 g[n]=... if l>=#c then d(g) end end f(function() for n,o in ipairs(i)do o:cancel() end end) for n,o in ipairs(c)do i[n]=o:finally(function(...) m(n,...) end) end end) end function b.race(c) assert(type(c)=="table",string.format(ab,"Promise.race")) for d,e in pairs(c)do assert(b.is(e),string.format(aa,"Promise.race",tostring(d))) end return b._new(debug.traceback(nil,2),function(d,e,f) local g={} local i=false local function l() for m,n in ipairs(g)do n:cancel() end end local function m(n) return function(...) l() i=true return n(...) end end if f(m(e))then return end for n,o in ipairs(c)do g[n]=o:andThen(m(d),m(e)) end if i then l() end end) end function b.each(c,d) assert(type(c)=="table",string.format(ab,"Promise.each")) assert(aq(d),string.format(an,"Promise.each")) return b._new(debug.traceback(nil,2),function(e,f,g) local i={} local l={} local m=false local function n() for o,p in ipairs(l)do p:cancel() end end g(function() m=true n() end) local o={} for p,q in ipairs(c)do if b.is(q)then if q:getStatus()==b.Status.Cancelled then n() return f(at.new{ error="Promise is cancelled", kind=at.Kind.AlreadyCancelled, context=string.format( "The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", p, q._source ), }) elseif q:getStatus()==b.Status.Rejected then n() return f(select(2,q:await())) end local r=q:andThen(function(...) return... end) table.insert(l,r) o[p]=r else o[p]=q end end for p,q in ipairs(o)do if b.is(q)then local r r,q=q:await() if not r then n() return f(q) end end if m then return end local r=b.resolve(d(q,p)) table.insert(l,r) local s,t=r:await() if not s then n() return f(t) end i[p]=t end e(i) end) end function b.is(c) if type(c)~="table"then return false end local d=getmetatable(c) if d==b then return true elseif d==nil then return aq(c.andThen) elseif type(d)=="table" and type(rawget(d,"__index"))=="table" and aq(rawget(rawget(d,"__index"),"andThen")) then return true end return false end function b.promisify(c) return function(...) return b._try(debug.traceback(nil,2),c,...) end end do local c local d function b.delay(e) assert(type(e)=="number","Bad argument #1 to Promise.delay, must be a number.") if not(e>=1.6666666666666665E-2)or e==math.huge then e=1.6666666666666665E-2 end return b._new(debug.traceback(nil,2),function(f,g,i) local l=b._getTime() local m=l+e local n={ resolve=f, startTime=l, endTime=m, } if d==nil then c=n d=b._timeEvent:Connect(function() local o=b._getTime() while c~=nil and c.endTime<o do local p=c c=p.next if c==nil then d:Disconnect() d=nil else c.previous=nil end p.resolve(b._getTime()-p.startTime) end end) else if c.endTime<m then local o=c local p=o.next while p~=nil and p.endTime<m do o=p p=o.next end o.next=n n.previous=o if p~=nil then n.next=p p.previous=n end else n.next=c c.previous=n c=n end end i(function() local o=n.next if c==n then if o==nil then d:Disconnect() d=nil else o.previous=nil end c=o else local p=n.previous p.next=o if o~=nil then o.previous=p end end end) end) end end function b.prototype.timeout(c,d,e) local f=debug.traceback(nil,2) return b.race{ b.delay(d):andThen(function() return b.reject(e==nil and at.new{ kind=at.Kind.TimedOut, error="Timed out", context=string.format( "Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", d, f ), }or e) end), c, } end function b.prototype.getStatus(c) return c._status end function b.prototype._andThen(c,d,e,f) c._unhandledRejection=false if c._status==b.Status.Cancelled then local g=b.new(function()end) g:cancel() return g end return b._new(d,function(g,i,l) local m=g if e then m=ay(d,e,g,i) end local n=i if f then n=ay(d,f,g,i) end if c._status==b.Status.Started then table.insert(c._queuedResolve,m) table.insert(c._queuedReject,n) l(function() if c._status==b.Status.Started then table.remove(c._queuedResolve,table.find(c._queuedResolve,m)) table.remove(c._queuedReject,table.find(c._queuedReject,n)) end end) elseif c._status==b.Status.Resolved then m(unpack(c._values,1,c._valuesLength)) elseif c._status==b.Status.Rejected then n(unpack(c._values,1,c._valuesLength)) end end,c) end function b.prototype.andThen(c,d,e) assert(d==nil or aq(d),string.format(an,"Promise:andThen")) assert(e==nil or aq(e),string.format(an,"Promise:andThen")) return c:_andThen(debug.traceback(nil,2),d,e) end function b.prototype.catch(c,d) assert(d==nil or aq(d),string.format(an,"Promise:catch")) return c:_andThen(debug.traceback(nil,2),nil,d) end function b.prototype.tap(c,d) assert(aq(d),string.format(an,"Promise:tap")) return c:_andThen(debug.traceback(nil,2),function(...) local e=d(...) if b.is(e)then local f,g=au(...) return e:andThen(function() return unpack(g,1,f) end) end return... end) end function b.prototype.andThenCall(c,d,...) assert(aq(d),string.format(an,"Promise:andThenCall")) local e,f=au(...) return c:_andThen(debug.traceback(nil,2),function() return d(unpack(f,1,e)) end) end function b.prototype.andThenReturn(c,...) local d,e=au(...) return c:_andThen(debug.traceback(nil,2),function() return unpack(e,1,d) end) end function b.prototype.cancel(c) if c._status~=b.Status.Started then return end c._status=b.Status.Cancelled if c._cancellationHook then c._cancellationHook() end coroutine.close(c._thread) if c._parent then c._parent:_consumerCancelled(c) end for d in pairs(c._consumers)do d:cancel() end c:_finalize() end function b.prototype._consumerCancelled(c,d) if c._status~=b.Status.Started then return end c._consumers[d]=nil if next(c._consumers)==nil then c:cancel() end end function b.prototype._finally(c,d,e) c._unhandledRejection=false local f=b._new(d,function(f,g,i) local l i(function() c:_consumerCancelled(c) if l then l:cancel() end end) local m=f if e then m=function(...) local n=e(...) if b.is(n)then l=n n :finally(function(o) if o~=b.Status.Rejected then f(c) end end) :catch(function(...) g(...) end) else f(c) end end end if c._status==b.Status.Started then table.insert(c._queuedFinally,m) else m(c._status) end end) return f end function b.prototype.finally(c,d) assert(d==nil or aq(d),string.format(an,"Promise:finally")) return c:_finally(debug.traceback(nil,2),d) end function b.prototype.finallyCall(c,d,...) assert(aq(d),string.format(an,"Promise:finallyCall")) local e,f=au(...) return c:_finally(debug.traceback(nil,2),function() return d(unpack(f,1,e)) end) end function b.prototype.finallyReturn(c,...) local d,e=au(...) return c:_finally(debug.traceback(nil,2),function() return unpack(e,1,d) end) end function b.prototype.awaitStatus(c) c._unhandledRejection=false if c._status==b.Status.Started then local d=coroutine.running() c :finally(function() task.spawn(d) end) :catch( function()end ) coroutine.yield() end if c._status==b.Status.Resolved then return c._status,unpack(c._values,1,c._valuesLength) elseif c._status==b.Status.Rejected then return c._status,unpack(c._values,1,c._valuesLength) end return c._status end local function c(d,...) return d==b.Status.Resolved,... end function b.prototype.await(d) return c(d:awaitStatus()) end local function d(e,...) if e~=b.Status.Resolved then error((...)==nil and"Expected Promise rejected with no value."or(...),3) end return... end function b.prototype.expect(e) return d(e:awaitStatus()) end b.prototype.awaitValue=b.prototype.expect function b.prototype._unwrap(e) if e._status==b.Status.Started then error("Promise has not resolved or rejected.",2) end local f=e._status==b.Status.Resolved return f,unpack(e._values,1,e._valuesLength) end function b.prototype._resolve(e,...) if e._status~=b.Status.Started then if b.is((...))then (...):_consumerCancelled(e) end return end if b.is((...))then if select("#",...)>1 then local f=string.format([[When returning a Promise from andThen, extra arguments are discarded! See:%s]], e._source ) warn(f) end local f=... local g=f:andThen(function(...) e:_resolve(...) end,function(...) local g=f._values[1] if f._error then g=at.new{ error=f._error, kind=at.Kind.ExecutionError, context="[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]", }end if at.isKind(g,at.Kind.ExecutionError)then return e:_reject(g:extend{ error="This Promise was chained to a Promise that errored.", trace="", context=string.format( "The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", e._source ), }) end e:_reject(...) end) if g._status==b.Status.Cancelled then e:cancel() elseif g._status==b.Status.Started then e._parent=g g._consumers[e]=true end return end e._status=b.Status.Resolved e._valuesLength,e._values=au(...) for f,g in ipairs(e._queuedResolve)do coroutine.wrap(g)(...) end e:_finalize() end function b.prototype._reject(e,...) if e._status~=b.Status.Started then return end e._status=b.Status.Rejected e._valuesLength,e._values=au(...) if not az(e._queuedReject)then for f,g in ipairs(e._queuedReject)do coroutine.wrap(g)(...) end else local f=tostring((...)) coroutine.wrap(function() b._timeEvent:Wait() if not e._unhandledRejection then return end local g=string.format("Unhandled Promise rejection:\n\n%s\n\n%s",f,e._source) for i,l in ipairs(b._unhandledRejectionCallbacks)do task.spawn(l,e,unpack(e._values,1,e._valuesLength)) end if b.TEST then return end warn(g) end)() end e:_finalize() end function b.prototype._finalize(e) for f,g in ipairs(e._queuedFinally)do coroutine.wrap(g)(e._status) end e._queuedFinally=nil e._queuedReject=nil e._queuedResolve=nil if not b.TEST then e._parent=nil e._consumers=nil end task.defer(coroutine.close,e._thread) end function b.prototype.now(e,f) local g=debug.traceback(nil,2) if e._status==b.Status.Resolved then return e:_andThen(g,function(...) return... end) else return b.reject(f==nil and at.new{ kind=at.Kind.NotResolvedInTime, error="This Promise was not resolved in time for :now()", context=":now() was called at:\n\n"..g, }or f) end end function b.retry(e,f,...) assert(aq(e),"Parameter #1 to Promise.retry must be a function") assert(type(f)=="number","Parameter #2 to Promise.retry must be a number") local g,i={...},select("#",...) return b.resolve(e(...)):catch(function(...) if f>0 then return b.retry(e,f-1,unpack(g,1,i)) else return b.reject(...) end end) end function b.retryWithDelay(e,f,g,...) assert(aq(e),"Parameter #1 to Promise.retry must be a function") assert(type(f)=="number","Parameter #2 (times) to Promise.retry must be a number") assert(type(g)=="number","Parameter #3 (seconds) to Promise.retry must be a number") local i,l={...},select("#",...) return b.resolve(e(...)):catch(function(...) if f>0 then b.delay(g):await() return b.retryWithDelay(e,f-1,g,unpack(i,1,l)) else return b.reject(...) end end) end function b.fromEvent(e,f) f=f or function() return true end return b._new(debug.traceback(nil,2),function(g,i,l) local m local n=false local function o() m:Disconnect() m=nil end m=e:Connect(function(...) local p=f(...) if p==true then g(...) if m then o() else n=true end elseif type(p)~="boolean"then error"Promise.fromEvent predicate should always return a boolean" end end) if n and m then return o() end l(o) end) end function b.onUnhandledRejection(e) table.insert(b._unhandledRejectionCallbacks,e) return function() local f=table.find(b._unhandledRejectionCallbacks,e) if f then table.remove(b._unhandledRejectionCallbacks,f) end end end return b end end, Properties={ Name="Promise" }, Reference=54, ClassName="ModuleScript" }, { ClassName="ModuleScript", Closure=function()return function(a) local aa={}; a.SetupLazyLoader(script,aa) return aa end end, Properties={ Name="TableUtil" }, Reference=57, Children={ { Closure=function() return function(a) local aa=a.Services local ab=aa.HttpService local an=clonefunction or function(an)return an end local function ao(aq,as) as=as or{} local at=typeof(aq); if at=='table'then if as[aq]then return as[aq] else local au={} as[aq]=au for av,aw in next,aq do au[ao(av,as)]=ao(aw,as) end; setmetatable(au,ao(getmetatable(aq),as)) return au end elseif at=='function'then return an(aq) else return aq end end return function(aq,as) if as then return ao(aq) end return ab:JSONDecode(ab:JSONEncode(aq)) end end end, Properties={ Name="Clone" }, Reference=58, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(...) local aa={}; for ab,an in{...}do for ao,aq in an do table.insert(aa,aq) end end return aa end end end, Properties={ Name="JoinArrays" }, Reference=60, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(aa) local ab={}; for an in aa do table.insert(ab,an) end return ab end end end, Properties={ Name="Keys" }, Reference=59, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(aa) local ab={}; for an,ao in aa do table.insert(ab,ao) end return ab end end end, Properties={ Name="Values" }, Reference=61, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(aa,ab) local an={}; for ao,aq in aa do ab(aq,ao,an); end return an end end end, Properties={ Name="Map" }, Reference=63, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(...) local aa={}; for ab,an in{...}do for ao,aq in an do aa[ao]=aq end end return aa end end end, Properties={ Name="JoinDictionaries" }, Reference=62, ClassName="ModuleScript" }, { Closure=function()return function(a) return function(aa) local ab=0; for an in aa do ab=ab+1 end return ab end end end, Properties={ Name="GetDictionarySize" }, Reference=64, ClassName="ModuleScript" } } }, { Closure=function()return function(a) local aa=a.Cache.TreeCache local ab={Delimiter="/"}; local an=game.WaitForChild local ao=game.FindFirstChild local function aq(as,at,au) local av=aa[as]; if av then return av end local aw=string.split(as,ab.Delimiter); for ax,ay in aw do at=ao(at,ay)or(au and an(at,ay,au))or nil; if(not at)then return nil end end aa[as]=at return at end function ab.SetDelimiter(as) ab.Delimiter=as or"/" end function ab.Find(as,at) local au=aq(at,as); return au end function ab.Await(as,at,au) local av=aq(at,as,au); return av end return ab end end, Properties={ Name="Tree" }, Reference=56, ClassName="ModuleScript" }, { Closure=function()return function(a) local aa=a.Services local ab=aa.RunService local an=newproxy() local ao=newproxy() local aq=table.freeze{"Destroy","Disconnect","destroy","disconnect"} local function as(at,au) local av=typeof(at) if av=="function"then return an elseif av=="thread"then return ao end if au then return au end if av=="Instance"or av=="DrawingObject"then return"Destroy" elseif av=="RBXScriptConnection"then return"Disconnect" elseif av=="table"then for aw,ax in aq do if typeof(at[ax])=="function"then return ax end end end error(string.format('failed to get cleanup function for object %s: %s',tostring(av),tostring(at)),3) end local function at(au) if typeof(au)~="table" or typeof(au.getStatus)~="function" or typeof(au.finally)~="function" or typeof(au.cancel)~="function" then error("did not receive a promise as an argument",3) end end local au={} au.__index=au function au.new() local av=setmetatable({},au) av._objects={} av._cleaning=false return av end function au.Add(av,aw,ax) if av._cleaning then error("cannot call trove:Add() while cleaning",2) end local ay=as(aw,ax) table.insert(av._objects,{aw,ay}) return aw end function au.Clone(av,aw) if av._cleaning then error("cannot call trove:Clone() while cleaning",2) end return av:Add(aw:Clone()) end function au.Construct(av,aw,...) if av._cleaning then error("Cannot call trove:Construct() while cleaning",2) end local ax local ay=type(aw) if ay=="table"then ax=aw.new(...) elseif ay=="function"then ax=aw(...) end return av:Add(ax) end function au.Connect(av,aw,ax) if av._cleaning then error("Cannot call trove:Connect() while cleaning",2) end return av:Add(aw:Connect(ax)) end function au.BindToRenderStep(av,aw,ax,ay) if av._cleaning then error("cannot call trove:BindToRenderStep() while cleaning",2) end ab:BindToRenderStep(aw,ax,ay) av:Add(function() ab:UnbindFromRenderStep(aw) end) end function au.AddPromise(av,aw) if av._cleaning then error("cannot call trove:AddPromise() while cleaning",2) end at(aw) if aw:getStatus()=="Started"then aw:finally(function() if av._cleaning then return end av:_findAndRemoveFromObjects(aw,false) end) av:Add(aw,"cancel") end return aw end function au.Remove(av,aw) if av._cleaning then error("cannot call trove:Remove() while cleaning",2) end return av:_findAndRemoveFromObjects(aw,true) end function au.Extend(av) if av._cleaning then error("cannot call trove:Extend() while cleaning",2) end return av:Construct(au) end function au.Clean(av) if av._cleaning then return end av._cleaning=true for aw,ax in av._objects do av:_cleanupObject(ax[1],ax[2]) end table.clear(av._objects) av._cleaning=false end function au.WrapClean(av) return function() av:Clean() end end function au._findAndRemoveFromObjects(av,aw,ax) local ay=av._objects for az,b in ay do if b[1]==aw then local c=#ay ay[az]=ay[c] ay[c]=nil if ax then av:_cleanupObject(b[1],b[2]) end return true end end return false end function au._cleanupObject(av,aw,ax) if ax==an then task.spawn(aw) elseif ax==ao then pcall(task.cancel,aw) else aw[ax](aw) end end function au.AttachToInstance(av,aw) if av._cleaning then error("cannot call trove:AttachToInstance() while cleaning",2) elseif not aw:IsDescendantOf(game)then error("instance is not a descendant of the game hierarchy",2) end return av:Connect(aw.Destroying,function() av:Destroy() end) end function au.Destroy(av) av:Clean() end return{ new=au.new, } end end, Properties={ Name="Trove" }, Reference=53, ClassName="ModuleScript" } } } } }, { Closure=function() return function(a) return{ LRM_Variables={ LRM_IsUserPremium=LRM_IsUserPremium or true, LRM_LinkedDiscordID=LRM_LinkedDiscordID or 490876399230386176, LRM_ScriptName=LRM_ScriptName or"Rawhead", LRM_TotalExecutions=LRM_TotalExecutions or 5, LRM_SecondsLeft=LRM_SecondsLeft or 300, LRM_UserNote=LRM_UserNote or"Developer | Premium | Lifetime", LRM_ScriptVersion=LRM_ScriptVersion or"0.0.0.1" } } end end, Properties={ Name="Variables" }, Reference=65, ClassName="ModuleScript" }, { Closure=function() return function(a) return setmetatable({},{ __index=function(aa,ab) local an,ao=pcall(game.GetService,game,ab); if an then local aq=cloneref(ao) rawset(aa,ab,aq) return aq end return nil end, }) end end, Properties={ Name="Services" }, Reference=66, ClassName="ModuleScript" } } } } } } do local aa,ab,an,ao,aq,as,at,au,av,aw,ax,ay,az,b,c,d='0.4.2',Flags or{},script,next,unpack,table,require,type,pcall,getfenv,setfenv,setmetatable,rawget,coroutine,task,Instance local e,f,g,i,l,m,n,o,p=as.insert,as.freeze,b.wrap,c.defer,c.cancel,d.new,(ab.ContextualExecution==nil and true)or ab.ContextualExecution do if n then local q=game:GetService'RunService'o=q:IsServer()p=q:IsClient()end end local q,r,s,t,z,A={},{},{},{},{},{}local function B(C)local D,G=av(m,C.ClassName)if not D then return end q[C.Reference]=G if C.Closure then s[G]=C.Closure if G:IsA'BaseScript'then e(z,G)end end if C.Properties then for H,I in ao,C.Properties do av(function()G[H]=I end)end end if C.RefProperties then for H,I in ao,C.RefProperties do e(r,{InstanceObject=G,Property=H,ReferenceId=I})end end if C.Attributes then for H,I in ao,C.Attributes do av(G.SetAttribute,G,H,I)end end if C.Children then for H,I in ao,C.Children do local J=B(I)if J then J.Parent=G end end end return G end local C={}do for D,G in ao,a do e(C,B(G))end end local D=aw(0)local function G(H)local I=t[H]if H.ClassName=='ModuleScript'and I then return aq(I)end local J=s[H]if not J then return end do local K local L={maui=f{Version=aa,Script=an,Shared=A,GetScript=function()return an end,GetShared=function()return A end},script=H,require=function(L,...)if L and L.ClassName=='ModuleScript'and s[L]then return G(L)end return at(L,...)end,getfenv=function(L,...)if au(L)=='number'and L>=0 then if L==0 then return K else L=L+1 local M,N=av(aw,L)if M and N==D then return K end end end return aw(L,...)end,setfenv=function(L,M,...)if au(L)=='number'and L>=0 then if L==0 then return ax(K,M)else L=L+1 local N,O=av(aw,L)if N and O==D then return ax(K,M)end end end return ax(L,M,...)end}K=ay({},{__index=function(M,N)local O=az(K,N)if O~=nil then return O end local P=L[N]if P~=nil then return P end return D[N]end})ax(J,K)end local K=g(J)if H:IsA'BaseScript'then local L=(not n or not H.Disabled)and i(K)if n then local M M=H:GetPropertyChangedSignal'Disabled':Connect(function(N)M:Disconnect()if N==false then G(H)else av(l,L)end end)end return else local L={K()}t[H]=L return aq(L)end end for H,I in ao,r do av(function()I.InstanceObject[I.Property]=q[I.ReferenceId]end)end for H,I in ao,z do if not n or((o and I.ClassName=='Script')or(p and I.ClassName=='LocalScript'))then G(I)end end if ab.ReturnMainModule==nil or ab.ReturnMainModule then local H do for I,J in ao,C do if J.ClassName=='ModuleScript'and J.Name=='MainModule'then H=J break end end end if H then return G(H)end end end