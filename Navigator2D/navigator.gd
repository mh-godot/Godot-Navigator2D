tool
extends Node2D

signal on_destination_reached(navigator, position)

export (float) var NavigationStopEpsilon = 5
export (float) var Speed = 50
export (bool) var OptimizePath = false
export (bool) var LookAt = true
export (NodePath) onready var NavigationPath
onready var navigation = get_node(NavigationPath)
var motion = Vector2(0, 0)

var actor
var path
var current_destination
var next_destination
var is_navigating

func navigate_to(destination):
    current_destination = destination
    path = navigation.get_simple_path(actor.global_position, current_destination.global_position, OptimizePath)
    is_navigating = true

func navigate(delta):
    var distance_to_destination = actor.global_position.distance_to(path[0])
    next_destination = path[0]
    if distance_to_destination > NavigationStopEpsilon:
        move(delta)
    else:
        update_path()

func move(delta):
    if LookAt:
        actor.look_at(next_destination)
    motion = (next_destination - actor.global_position).normalized() * Speed * delta
    actor.global_position += motion

func update_path():
    if path.size() == 1:
        is_navigating = false
        emit_signal("on_destination_reached", self, current_destination)
    else:
        path.remove(0)

func _physics_process(delta):
    if is_navigating:
        navigate(delta)

func _enter_tree():
    actor = get_parent()
    pass

func _exits_tree():
    pass
