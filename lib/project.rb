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

  #below method not yet passing

  def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{title}') RETURNING id;")
  @id = result.first().fetch("id").to_i
  end

end
