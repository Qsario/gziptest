require 'sinatra'

class Protected < Sinatra::Base
  get '/' do
    'GZip Test Server<br>
     Available files:<br>
     <ul>
     <li><a href="./A1KB">1 KB of As</a></li>
     <li><a href="./cacheable_A1KB">1 KB of As, may return HTTP 304</a></li>
     <li><a href="./json">JSON sample</a></li>
     <li><a href="./cacheable_json">JSON sample, may return HTTP 304</a></li>
     </ul>'
  end

  get '/A1KB' do
    "A"*1024
  end

  get '/cacheable_A1KB' do
    # These never change, so I set a time suitably in the past.
    last_modified Time.utc(2015,1,1,0,0)
    # The content is static, so the SHA1 hash of it is, too.
    etag "746c3f4d286c531e065e8af76e0ac0868831c6b4"
    "A"*1024
  end

  get '/json' do
    '{"test": "success"}'
  end

  get '/cacheable_json' do
    last_modified Time.utc(2015,1,1,0,0)
    etag "a74bc31dc4569bd2dcf3a37cab2c335c9d4f9eb9"
    '{"test": "success"}'
  end

end
