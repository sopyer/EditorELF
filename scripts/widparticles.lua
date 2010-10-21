
function ediInitWidParticles()
	editor.gui.properties.widParticles = {}
	local widParticles = editor.gui.properties.widParticles

	widParticles.object = CreateScreen(editor.gui.properties.object, "WidParticles", 0, 25, 248, 400)

	widParticles.minimize = CreateButton(widParticles.object, "Particles", 1, 1, 246, 14, "Particles")

	SetScreenSize(widParticles.object, 248, 16)
end

function ediUpdateWidParticlesSelection()
	local widParticles = editor.gui.properties.widParticles
	local sel = ediGetSelection()
end

function ediUpdateWidParticles()
	local widParticles = editor.gui.properties.widParticles
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widParticles.minimize) == CLICKED then
		if GetGuiObjectSize(widParticles.object).y > 16 then
			SetScreenSize(widParticles.object, 248, 16)
		else
			SetScreenSize(widParticles.object, 248, 400)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end
end

