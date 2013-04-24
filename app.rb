require 'sinatra'
require 'data_mapper'
require_relative 'num_to_words'
require 'pry'


DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/num_to_words.db")

class Exercise
  include DataMapper::Resource
  property :id, Serial
  property :num, Text
end

DataMapper.finalize.auto_upgrade!

get '/' do
  @exercises = Exercise.all order: :num.asc
  erb :index
end


get '/:id' do
  @exercise = Exercise.get params[:id]
  erb :view   
end

post '/' do
  exercise = Exercise.new
  exercise.num        = params[:number]
  exercise.save
  redirect '/'  
end