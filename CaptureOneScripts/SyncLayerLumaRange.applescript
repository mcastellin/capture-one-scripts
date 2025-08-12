(*
SyncLayerLumaRange synchronizes the luma range of non-background layers
with the same name of all selected image variants.
*)
tell application "Capture One"
	try
		set selectedImages to selected variants
		if (count of selectedImages) = 0 then
			display alert "No images selected" message "Please select one or more images first."
			return
		end if
		set curLayer to current layer of primary variant
		if kind of curLayer is background then
			display alert "Could not sync image layer" message "Please selected an image layer to synchronize"
			return
		end if
		set curLayerName to name of curLayer
		set curLayerLumaRange to (get luma range of curLayer)
		
		repeat with img in selectedImages
			set imgLayers to (layers of img whose kind is not background)
			repeat with imgLayer in imgLayers
				if name of imgLayer = curLayerName then
					set luma to luma range of imgLayer
					set range low of luma to (get range low of curLayerLumaRange)
					set range high of luma to (get range high of curLayerLumaRange)
					set falloff low of luma to (get falloff low of curLayerLumaRange)
					set falloff high of luma to (get falloff high of curLayerLumaRange)
					set invert of luma to (get invert of curLayerLumaRange)
					set radius of luma to (get radius of curLayerLumaRange)
					set sensitivity of luma to (get sensitivity of curLayerLumaRange)
				end if
			end repeat
		end repeat
	on error e
		display alert "Error" message e
	end try
end tell
