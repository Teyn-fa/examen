extends CanvasLayer

var segundos = 0
var minutos = 0
var horas = 0
var formated_time

func update_stopwatch():
	segundos = segundos + 1

func _on_button_pressed():
	update_stopwatch()
	if segundos > 59:
		minutos = minutos + 1
		segundos = 0
	if minutos > 59:
		horas = horas + 1
		minutos = 0
		segundos = 0
	if horas > 23:
		horas = 0
		minutos = 0
		segundos = 0
	$Tiempolabel.text = '%02d: %02d: %02d'%[horas, minutos, segundos]

func _on_timer_timeout():
	update_stopwatch()
	$Timer.start()
