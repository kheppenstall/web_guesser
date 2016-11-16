require 'sinatra'
require 'sinatra/reloader'
require 'erb'

SECRET_NUMBER = rand(100)


get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message = check_guess(guess) + cheat_message(cheat)
  erb :index, :locals => {
    :number => SECRET_NUMBER,
    :message => message}
end

def check_guess(guess)
  if !guess
    ""
  elsif guess.to_i > SECRET_NUMBER
    "Too high."
  elsif guess.to_i < SECRET_NUMBER
    "Too low."
  else
    "CORRECT! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

def cheat_message(cheat)
  if cheat
    " The Secret Number is #{SECRET_NUMBER}"
  else
    ""
  end
end