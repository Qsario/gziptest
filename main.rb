require 'sinatra'

class Protected < Sinatra::Base
  get '/' do
    'GZip Test Server<br>
     Available files:<br>
     <ul>
     <li><a href="./A1KB">1 KB of As</a></li>
     <li><a href="./json">JSON sample</a></li>
     </ul>'
  end

  get '/A1KB' do
    "A"*1024
  end

  get '/json' do
    '{"test": "success"}'
  end
end
