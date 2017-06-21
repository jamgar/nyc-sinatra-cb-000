class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end
end
