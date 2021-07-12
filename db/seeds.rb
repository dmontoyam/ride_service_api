require_relative '../app/models/driver'
require_relative '../app/models/rider'

#Seeds for the drivers
Driver.create(first_name: 'Daniel', last_name: 'Ramirez', email: 'driver1@gmail.com', status: 'ACTIVE', country: 'Colombia', state: 'Antioquia', city: 'Medellin', age: 28, current_latitude: 6.218975989889416, current_longitude: -75.5949736991638 )
Driver.create(first_name: 'Santiago', last_name: 'Londoño', email: 'driver2@gmail.com', status: 'ACTIVE', country: 'Colombia', state: 'Antioquia', city: 'Envigado', age: 30, current_latitude: 6.165594726695098, current_longitude: -75.58949960229486 )
Driver.create(first_name: 'Juan', last_name: 'Marulanda', email: 'driver3@gmail.com', status: 'ACTIVE', country: 'Colombia', state: 'Antioquia', city: 'Medellin', age: 35, current_latitude: 6.222109373595448, current_longitude: -75.59206166801351 )

#Seeds for the riders
Rider.create(first_name: 'Mateo', last_name: 'Posada', email: 'rider1@gmail.com', status: 'ACTIVE', country: 'Colombia', state: 'Antioquia', city: 'Medellin', age: 28, current_latitude: 6.229394646529697, current_longitude: -75.59675008337844 , payment_method: "CARD")
Rider.create(first_name: 'Juliana', last_name: 'Vargas', email: 'rider2@gmail.com', status: 'ACTIVE', country: 'Colombia', state: 'Antioquia', city: 'Envigado', age: 31, current_latitude: 6.163248030703451,  current_longitude: -75.57207597297769 , payment_method: "CARD")
Rider.create(first_name: 'Vannesa', last_name: 'Maldonado', email: 'rider3@gmail.com', status: 'ACTIVE', country: 'Colombia', state: 'Antioquia', city: 'Medellin', age: 32, current_latitude: 6.244852174678537, current_longitude: -75.58443000041845 , payment_method: "CARD" )
