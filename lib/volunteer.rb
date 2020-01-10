class Volunteer
  attr_accessor :name, :id, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)


  end



#name might need to be a param instead of an instance var. if so remove @, this might not pass

  def save
  result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
  @id = result.first().fetch("id").to_i
  end

#below method might not pass

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :id => id, :project_id => project_id}))
    end
    volunteers

  end

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
