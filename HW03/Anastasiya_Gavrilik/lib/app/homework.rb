module App
  class Homework
    attr_reader :title, :author

    def initialize(title, author)
      @title = title
      @author = author
    end
  end
end
