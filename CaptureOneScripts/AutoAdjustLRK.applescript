(*
AdjustLRK tells Capture One to auto-adjust the following:
- Levels
- Rotation
- Keystoning

These adjustments are fairly reliable and can be automated for most images.
To fine-tune image corrections, refer to the CaptureOne settings menu.
*)
tell application "Capture One"
	autoadjust selected variants ¬
		adjust white balance false ¬
		adjust exposure false ¬
		adjust contrast brightness false ¬
		adjust hdr false ¬
		adjust levels true ¬
		adjust rotation true ¬
		with adjust keystone
end tell
