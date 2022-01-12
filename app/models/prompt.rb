class Prompt
  attr_accessor :title, :text, :path
  def initialize(title, text, path)
    @title = title
    @text = text
    @path = path
  end
end
