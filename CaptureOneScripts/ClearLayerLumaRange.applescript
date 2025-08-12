(*
ClearLayerLumaRange clears the luma range of non-background layers
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
		
		repeat with img in selectedImages
			set imgLayers to (layers of img whose kind is not background)
			repeat with imgLayer in imgLayers
				if name of imgLayer = curLayerName then
					clear luma range imgLayer
				end if
			end repeat
		end repeat
	on error e
		display alert "Error" message e
	end try
end tell
