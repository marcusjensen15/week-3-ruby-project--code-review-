class Project
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)

  end

  def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{title}') RETURNING id;")
  @id = result.first().fetch("id").to_i
  end


  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects

  end

  def ==(project_compare)
    if project_compare != nil
      self.title() == project_compare.title()
    else
      false
    end
  end


  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project

      title = project.fetch("title")
      id = project.fetch("id").to_i
      Project.new({:title => title, :id => id})
    else
      nil
    end

  end

#I CHANGED THE UPDATE FUNCTION TO BE #{@id} instead of #{id}
  def update(attributes)

    @title = attributes.fetch(:title)
    DB.exec("UPDATE projects SET title= '#{@title}' WHERE id = #{id};")

  end

  def delete()
    DB.exec("DELETE FROM projects WHERE id = #{@id};")

  end

  #below method isn't tested. gets all volunteers for a project.

  # def volunteers()
  #
  #   returned_volunteers = DB.exec("SELECT name FROM volunteers WHERE project_id = '#{@id}';")
  #   volunteers = []
  #   returned_volunteers.each do |volunteer|
  #     volunteers.push(volunteer.fetch("name"))
  #   end
  #   volunteers
  #
  # end

  #volunteers method re-write

  def volunteers()

    returned_volunteers = DB.exec("SELECT name FROM volunteers WHERE project_id = '#{@id}';")
    volunteers = []
    returned_volunteers.each do |volunteer|
      volunteers.push(Volunteer.new({:name => volunteer.fetch("name"),:id => nil, :project_id => volunteer.fetch("project_id")}))
    end
    volunteers

  end

 # Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})


end
