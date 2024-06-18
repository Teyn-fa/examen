extends CanvasLayer

var segundos = 0
var minutos = 0
var decimales = 0
var formated_time
var is_timer = true
var mode_label = 'TIMER'


func update_label():
	$Clabel.text = str(decimales)
	$Tiempolabel.text = '%02d:%02d:%02d'%[minutos, segundos, decimales]

func _on_modo_timer_pressed():
	if $Timer.is_stopped():
		minutos = 0
		segundos = 0
		decimales = 0
		is_timer = !is_timer
		if is_timer == true:
			mode_label = 'TIMER'
		else: mode_label = 'STOPWATCH'
		update_label()
		$ModoLabel.text = mode_label 

func _on_button_pressed():
	if $Timer.is_stopped():
		$Timer.start()
		$StatusLabel.text = 'RUNNING'
	else: 
		$Timer.stop()
		$StatusLabel.text = 'STOP'

func update_stopwatch():
	decimales = decimales + 1
	if decimales > 10:
		decimales = 0
		segundos = segundos + 1
	if segundos > 59:
		minutos = minutos + 1
		segundos = 0
	if minutos > 59:
		decimales = 9
		minutos = 59
		segundos = 59
		$StatusLabel.text = 'STOPPED'
		$Timer.stop()
	update_label()

func update_timer():
	decimales = decimales - 1
	if decimales < 0:
		decimales = 9
		segundos = segundos - 1
	if segundos < 0:
		minutos = minutos - 1
		segundos = 59
	if minutos < 0:
		decimales = 0
		minutos = 0
		segundos = 0
		$StatusLabel.text = 'STOPPED'
		$Timer.stop()
	update_label()


func _on_timer_timeout():
	if is_timer == false:
		update_stopwatch()
	else:
		update_timer()



func _on_seg_button_pressed():
	if $Timer.is_stopped() and is_timer == true:
		segundos = segundos + 1
		if segundos > 59:
			segundos = 0
			decimales = 0
	update_label()

func _on_min_button_pressed():
	if $Timer.is_stopped() and is_timer == true:
		minutos = minutos + 1 
		if minutos > 59:
			minutos = 0
			decimales = 0
	update_label()

func _on_clear_button_pressed():
	if $Timer.is_stopped(): 
		minutos = 0
		segundos = 0
		decimales = 0
		update_label()





