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

#below test not passing
  def id
    returned_id = @id
    returned_id
  end


end
