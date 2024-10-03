function init()
  if animator then
    animator.setAnimationState("teleport", "beamOutTPlayer")
    effect.setParentDirectives("?multiply=ffffff00")
    animator.setGlobalTag("effectDirectives", status.statusProperty("effectDirectives", ""))

    local speciesTags = config.getParameter("speciesTags")
    if status.statusProperty("species") then
      animator.setGlobalTag("species", speciesTags[status.statusProperty("species")] or "")
    end

    self.triggerTimer = config.getParameter("triggerTime")
  else
    sb.logError("Animator is nil in beamout_tplayer.lua")
  end
end

function update(dt)
  if animator then
    if self.triggerTimer > 0 then
      self.triggerTimer = self.triggerTimer - dt
      if self.triggerTimer <= 0 then
        trigger()
      end
    end
  end
end

function trigger()
  status.addEphemeralEffect("beamin_tplayer")
end