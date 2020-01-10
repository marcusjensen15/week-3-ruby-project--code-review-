class Project
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id).to_i

  end

  def title
    returned_title = @title
    returned_title
  end



end
