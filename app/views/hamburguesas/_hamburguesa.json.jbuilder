json.extract! hamburguesa, :id, :nombre, :precio, :descripcion, :created_at, :updated_at
json.url hamburguesa_url(hamburguesa, format: :json)
