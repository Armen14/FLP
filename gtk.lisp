(defun run()
	(let ((output *standard-output*))
		(gtk:within-main-loop
			(let ((window (make-instance 'gtk:gtk-window
											:type :toplevel
											:window-position :center
											:title "hello"
											:default-width 300
											:default-height 100))
				   (button (make-instance 'gtk:button :label "Hello"))
				   (counter 0))
				(gobject:g-signal-connect button "clicked"
					(lambda (b)
						(declare (ignore b))
						(format output "Hello~%")
						(setf (gtk:button-label button)
							(format nil
								"Hello (clicked ~D times)"
								(incf counter)))))
				(gtk:countainer-add window button)
				(gtk:widget-show window :all t)))))	
