require 'httparty'

HTTParty.post('http://localhost:3000/api/v1/pins', headers: {'Content-Type'=> 'application/json', 'X-Api_Token' => '0cedb7d9938422db770cbf44acee4bc0', 'X-User-Email' => 'anderson.marquez@gmail.com'}, body: {title: "Hola", image_url: 'http://OJO.jpg'}.to_json)
