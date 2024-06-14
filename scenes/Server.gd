extends Node

var server: ENetMultiplayerPeer
const PORT: int = 4242

func _ready():
	server = ENetMultiplayerPeer.new()
	server.create_server(PORT)
	print("Server started on port ", PORT)
	
	server.connect("peer_connected", Callable(self, "_on_peer_connected"))
	server.connect("peer_disconnected", Callable(self, "_on_peer_disconnected"))
	get_tree().connect("network_peer_packet", Callable(self, "_on_data_received"))

func _on_peer_connected(id):
	print("Client connected: ", id)
	# Define o servidor como o network_peer do cliente conectado
	var peer = get_tree().get_network_peer(id)
	peer.set_network_peer(server)

func _on_peer_disconnected(id):
	print("Client disconnected: ", id)

func _on_data_received(id, packet):
	var data = packet.get_string_from_utf8()
	
	var json = JSON.new()
	var result = json.parse(data)
	if result.error != OK:
		print("Failed to parse JSON: ", result.error_string)
		return
	
	var input_data = result.result
	print("Received data: ", input_data)
