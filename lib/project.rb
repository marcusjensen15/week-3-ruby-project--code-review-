class Project

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id).to_i

  end



end
