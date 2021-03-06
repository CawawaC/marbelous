extends Node2D

onready var drawing = get_node("LineDrawing2D")
onready var shape_anchor = get_node("ShapeAnchor")

onready var circle_shape_tscn = preload("res://scenes/shapes/CircleShape.tscn")
onready var triangle_shape_tscn = preload("res://scenes/shapes/TriangleShape.tscn")
onready var quad_shape_tscn = preload("res://scenes/shapes/QuadShape.tscn")

func _ready() -> void:
	drawing.connect("circle_created", self, "_on_circle_created")
	drawing.connect("triangle_created", self, "_on_triangle_created")
	drawing.connect("quad_created", self, "_on_quad_created")

func _on_circle_created(position : Vector2, radius : float) -> void:
	var circle_shape = circle_shape_tscn.instance()
	circle_shape.set_radius(radius)
	circle_shape.position = position
	shape_anchor.add_child(circle_shape)

func _on_triangle_created(corners : PoolVector2Array) -> void:
	var triangle_shape = triangle_shape_tscn.instance()
	triangle_shape.set_corners(corners)
	shape_anchor.add_child(triangle_shape)

func _on_quad_created(corners : PoolVector2Array) -> void:
	var quad_shape = quad_shape_tscn.instance()
	quad_shape.set_corners(corners)
	shape_anchor.add_child(quad_shape)
