class Volunteer
  attr_accessor :name, :id, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)


  end

  # def title
  #   returned_title = @title
  #   returned_title
  # end


  # def id
  #   returned_id = @id
  #   returned_id
  # end


  # def save
  # result = DB.exec("INSERT INTO projects (title) VALUES ('#{title}') RETURNING id;")
  # @id = result.first().fetch("id").to_i
  # end
  #
  #
  # def self.all
  #   returned_projects = DB.exec("SELECT * FROM projects;")
  #   projects = []
  #   returned_projects.each() do |project|
  #     title = project.fetch("title")
  #     id = project.fetch("id").to_i
  #     projects.push(Project.new({:title => title, :id => id}))
  #   end
  #   projects
  #
  # end

  def ==(volunteer_compare)
    if volunteer_compare != nil
      self.name() == volunteer_compare.name()
    else
      false
    end
  end


  # def self.find(id)
  #   project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
  #   if project
  #
  #     title = project.fetch("title")
  #     id = project.fetch("id").to_i
  #     Project.new({:title => title, :id => id})
  #   else
  #     nil
  #   end
  #
  # end
  #
  #
  # def update(attributes)
  #
  #   @title = attributes.fetch(:title)
  #   DB.exec("UPDATE projects SET title= '#{@title}' WHERE id = #{id};")
  #
  # end
  #
  # def delete()
  #   DB.exec("DELETE FROM projects WHERE id = #{@id};")
  #
  # end




end
