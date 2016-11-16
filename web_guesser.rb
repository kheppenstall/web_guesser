require 'sinatra'
require 'sinatra/reloader'
require 'erb'

SECRET_NUMBER = rand(100)


get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if !guess
    ""
  elsif guess.to_i > SECRET_NUMBER
    "Too high"
  elsif guess.to_i < SECRET_NUMBER
    "Too low"
  else
    "CORRECT! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end