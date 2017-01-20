class MathSet
  attr_reader :elements

  def initialize(*e)
    @elements = e;
  end

  def +(e)
    if e.is_a? MathSet
      e.elements.each do |elem|
        @elements << elem unless @elements.include?(elem)
      end
      self
    else
      @elements << e unless @elements.include?(e);
      self
    end
  end

end
