(*
SyncLayerAdjustments synchronizes the adjustments between non-background layers
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
		set curLayerName to name of curLayer
		set curLayerAdjustments to adjustments of curLayer
		
		if kind of curLayer is background then
			display alert "Could not sync image layer" message "Please selected an image layer to synchronize"
			return
		end if
		
		repeat with img in selectedImages
			set imgLayers to (layers of img whose kind is not background)
			repeat with imgLayer in imgLayers
				if name of imgLayer = curLayerName then
					set adj to adjustments of imgLayer
					
					(* White balance - uncomment to enable sync *)
					(*
					if temperature of curLayerAdjustments is not missing value then
						set temperature of adj to (get temperature of curLayerAdjustments)
					end if
					if tint of curLayerAdjustments is not missing value then
						set tint of adj to (get tint of curLayerAdjustments)
					end if
					*)
					
					(* Exposure *)
					if exposure of curLayerAdjustments is not missing value then
						set exposure of adj to (get exposure of curLayerAdjustments)
					end if
					if contrast of curLayerAdjustments is not missing value then
						set contrast of adj to (get contrast of curLayerAdjustments)
					end if
					if brightness of curLayerAdjustments is not missing value then
						set brightness of adj to (get brightness of curLayerAdjustments)
					end if
					if saturation of curLayerAdjustments is not missing value then
						set saturation of adj to (get saturation of curLayerAdjustments)
					end if
					
					(* HDR *)
					if highlight adjustment of curLayerAdjustments is not missing value then
						set highlight adjustment of adj to (get highlight adjustment of curLayerAdjustments)
					end if
					if white recovery of curLayerAdjustments is not missing value then
						set white recovery of adj to (get white recovery of curLayerAdjustments)
					end if
					if shadow recovery of curLayerAdjustments is not missing value then
						set shadow recovery of adj to (get shadow recovery of curLayerAdjustments)
					end if
					if black recovery of curLayerAdjustments is not missing value then
						set black recovery of adj to (get black recovery of curLayerAdjustments)
					end if
					
					(* Curves *)
					if rgb curve of curLayerAdjustments is not missing value then
						set rgb curve of adj to (get rgb curve of curLayerAdjustments)
					end if
					if luma curve of curLayerAdjustments is not missing value then
						set luma curve of adj to (get luma curve of curLayerAdjustments)
					end if
					if red curve of curLayerAdjustments is not missing value then
						set red curve of adj to (get red curve of curLayerAdjustments)
					end if
					if green curve of curLayerAdjustments is not missing value then
						set green curve of adj to (get green curve of curLayerAdjustments)
					end if
					if blue curve of curLayerAdjustments is not missing value then
						set blue curve of adj to (get blue curve of curLayerAdjustments)
					end if
					
					(* Color *)
					if color editor settings of curLayerAdjustments is not missing value then
						set color editor settings of adj to (get color editor settings of curLayerAdjustments)
					end if
					
					if color balance master hue of curLayerAdjustments is not missing value then
						set color balance master hue of adj to (get color balance master hue of curLayerAdjustments)
					end if
					if color balance master saturation of curLayerAdjustments is not missing value then
						set color balance master saturation of adj to (get color balance master saturation of curLayerAdjustments)
					end if
					if color balance shadow hue of curLayerAdjustments is not missing value then
						set color balance shadow hue of adj to (get color balance shadow hue of curLayerAdjustments)
					end if
					if color balance shadow saturation of curLayerAdjustments is not missing value then
						set color balance shadow saturation of adj to (get color balance shadow saturation of curLayerAdjustments)
					end if
					if color balance shadow lightness of curLayerAdjustments is not missing value then
						set color balance shadow lightness of adj to (get color balance shadow lightness of curLayerAdjustments)
					end if
					if color balance midtone hue of curLayerAdjustments is not missing value then
						set color balance midtone hue of adj to (get color balance midtone hue of curLayerAdjustments)
					end if
					if color balance midtone saturation of curLayerAdjustments is not missing value then
						set color balance midtone saturation of adj to (get color balance midtone saturation of curLayerAdjustments)
					end if
					if color balance midtone lightness of curLayerAdjustments is not missing value then
						set color balance midtone lightness of adj to (get color balance midtone lightness of curLayerAdjustments)
					end if
					if color balance highlight hue of curLayerAdjustments is not missing value then
						set color balance highlight hue of adj to (get color balance highlight hue of curLayerAdjustments)
					end if
					if color balance highlight saturation of curLayerAdjustments is not missing value then
						set color balance highlight saturation of adj to (get color balance highlight saturation of curLayerAdjustments)
					end if
					if color balance highlight lightness of curLayerAdjustments is not missing value then
						set color balance highlight lightness of adj to (get color balance highlight lightness of curLayerAdjustments)
					end if
					
				end if
			end repeat
		end repeat
	on error e
		display alert "Error" message e
	end try
end tell
