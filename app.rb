require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('pry')
require("pg")

also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

#this displays the homepage
get ('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)
end

#this displays the homepage
get ('/home') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)
end

#this displays the page allowing the user to add a new project
get('/project/new') do
  erb(:new_project)
end

#this allow the user to post a new project to the homepage

post ('/home') do

if params[:title] && params[:name]
  name = params[:name]
  project_id = params[:title]
  volunteer = Volunteer.new({:name => name, :project_id => project_id ,:id => nil})
  volunteer.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)

elsif params[:title]
    title = params[:title]
    project = Project.new({:title => title, :id => nil})
    project.save
    @projects = Project.all
    @volunteers = Volunteer.all
    erb(:home)
else
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)


  end
end

# This allows the user to view the add new volunteer page


get '/volunteer/new' do
  @projects = Project.all
  erb(:new_volunteer)
end

#this allow the user to post a new volunteer to the homepage
