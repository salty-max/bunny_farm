class_name HurtComponent extends Area2D

@export var tool: DataTypes.Tools = DataTypes.Tools.None

var damage: int

signal hurt


func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	damage = hit_component.hit_damage
	if tool == hit_component.current_tool && !hit_component.animated_sprite_2d.is_playing():
		hit_component.animated_sprite_2d.animation_finished.connect(on_hit_animation_finished)
		
		
func on_hit_animation_finished() -> void:
	hurt.emit(damage)
