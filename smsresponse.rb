require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

data = []
get '/smsresponse' do
  data.push(params[:From])
  data.push(params[:Body].split('.'))
  data.push((data[2] / 7).round(2))
  
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Tu placa #{data[0]} tiene #{data[2]} minuto/s disponibles, con un costo de #{data[2]}. Para mas informacion, consulte www.paco.org"
  end
  twiml.text
end
