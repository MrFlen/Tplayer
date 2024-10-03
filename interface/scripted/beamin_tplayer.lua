function init()
  if animator then
    animator.setAnimationState("teleport", "beamInTPlayer")
    effect.setParentDirectives("?multiply=ffffff00")
    animator.setGlobalTag("effectDirectives", status.statusProperty("effectDirectives", ""))

    local speciesTags = config.getParameter("speciesTags")
    if status.statusProperty("species") then
      animator.setGlobalTag("species", speciesTags[status.statusProperty("species")] or "")
    end

    if status.isResource("stunned") then
      status.setResource("stunned", math.max(status.resource("stunned"), effect.duration()))
    end
  else
    sb.logError("Animator is nil in beamin_tplayer.lua")
  end
end

function update(dt)
  if animator then
    effect.setParentDirectives(string.format("?multiply=%s", animator.animationStateProperty("teleport", "multiply")))
  end
end