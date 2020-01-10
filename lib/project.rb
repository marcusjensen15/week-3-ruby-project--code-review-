class Project
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)

  end

  def title
    returned_title = @title
    returned_title
  end


  def id
    returned_id = @id
    returned_id
  end

  #below method not yet fully passing

  def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{title}') RETURNING id;")
  @id = result.first().fetch("id").to_i
  end

#below method not yet passing - works but requires equals reconfig

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

end
