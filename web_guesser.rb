require 'sinatra'
require 'sinatra/reloader'
require 'erb'

number = rand(100)


get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess, number)
  if !guess
    ""
  elsif guess.to_i > number
    "Too high"
  elsif guess.to_i < number
    "Too low"
  elsif guess.to_i == number
    "CORRECT! The SECRET NUMBER is #{number}"
  end
end