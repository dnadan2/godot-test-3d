extends ImmediateGeometry

func _ready():
  self.begin(Mesh.PRIMITIVE_TRIANGLES,null)
  self.add_vertex(Vector3(0,2,0))
  self.add_vertex(Vector3(2,0,0))
  self.add_vertex(Vector3(-2,0,0))
  self.end()
