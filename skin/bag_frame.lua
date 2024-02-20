local ns = select(2, ...)

local function handler()
    ns.util.async.delay(5, function()
        print("bag_frame")
    end)
    -- if ns.util.get_flag(frame) then return end

    -- frame:SetTemplate("Transparent")
    -- -- self.SetBackdrop = E.noop
    -- -- self.SetBackdropColor = E.noop
    -- -- self.SetBackdropBorderColor = E.noop

    -- -- self.CloseButton.Text:Hide()
    -- -- self.CloseButton.isSkinned = false
    -- -- S:HandleCloseButton(self.CloseButton)
    -- -- self.CloseButton:SetHitRectInsets(1, 1, 2, 2)

    -- frame.__adiBagsElvUISkin = true
end

ns.skin.bag_frame = handler
