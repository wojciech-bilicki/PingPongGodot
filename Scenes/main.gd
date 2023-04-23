extends Node2D


var player_points = 0
var enemy_points = 0

@onready var enemy_paddle = $EnemyPaddle
@onready var player_paddle = $Paddle
@onready var ball = $Ball
@onready var UI = $UI

func enemy_scored():
	enemy_points += 1
	UI.update_enemy_points(enemy_points)
	reset_game_state()

func player_scored():
	player_points += 1
	UI.update_player_point(player_points)
	reset_game_state()

func reset_game_state():
	enemy_paddle.global_position.y = 0
	player_paddle.global_position.y = 0
	ball.velocity = Vector2.ZERO
	enemy_paddle.linear_velocity = Vector2.ZERO
	player_paddle.linear_velocity = Vector2.ZERO
	ball.global_position = Vector2.ZERO
	ball.start_ball()
