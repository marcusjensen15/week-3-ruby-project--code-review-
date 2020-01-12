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




#This will show the details and volunteers for a specific project

get ('/home/project/:id')do

  @project = Project.find(params[:id].to_i())
  @volunteers = @project.volunteers()

  erb(:project)

end

#This shows the edit page for a specific project

get('/home/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

#This will allow the user to delete a project

delete('/home/projects/:id')do
  @project = Project.find(params[:id].to_i())
  @project.delete()

  @projects = Project.all
  @volunteers = Volunteer.all

  erb(:home)
end



#NEED TO WRITE A PATCH TO UPDATE A PROJECT NAME


#This will allow the user to update a project

patch ('/home/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update({:title => params[:title], :id => nil})
  @volunteers = Volunteer.all
  @projects = Project.all

  erb(:home)
end

#This will display an individual volunteer's page

get ('/home/volunteers/:id')do

  @volunteer = Volunteer.find(params[:id].to_i())

  erb(:volunteer)

end

#This will allow the user to delete a volunteer (not working)

delete('/home/volunteers/:id')do
  @volunteer = Volunteer.find(params[:id].to_i())
  @volunteer.delete()

  @projects = Project.all
  @volunteers = Volunteer.all

  erb(:home)
end

#This will allow the user to update a volunteers name (not working)

patch ('/home/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  @volunteer.update({:name => params[:name], :id => nil})
  @volunteers = Volunteer.all
  @projects = Project.all

  erb(:home)
end

#This will display the edit volunteer page (not working)

get ('/home/volunteers/:id/edit')do

  @volunteer = Volunteer.find(params[:id].to_i())

  erb(:edit_volunteer)

end
