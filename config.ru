Dir.glob('./app/models/*.rb').sort.each do |file|
  require file
end
Dir.glob('./app/controllers/*.rb').sort.each do |file|
  require file
end

use AuthController

map '/' do
  run BaseController
end
