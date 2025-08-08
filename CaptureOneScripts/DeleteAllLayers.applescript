(*
DeleteAllLayers tells Capture One to remove all non-background layers from the
currently selected image variants.
*)
tell application "Capture One"
	try
		set selectedImages to selected variants
		if (count of selectedImages) = 0 then
			display alert "No images selected" message "Please select one or more images first."
			return
		end if
		repeat with img in selectedImages
			delete (every layer of img whose kind is not background)
		end repeat
	on error e
		display alert "Error" message e
	end try
end tell
