extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_hoe: Button = $MarginContainer/HBoxContainer/ToolHoe
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan


func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Axe)


func _on_tool_hoe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Hoe)


func _on_tool_watering_can_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WateringCan)
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_hoe.release_focus()
		tool_watering_can.release_focus()
