class MathSet
  attr_reader :elements

  def initialize(*e)
    @elements = e.uniq;
  end

  def count
    @elements.length
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

  def -(e)
    if e.is_a? MathSet
      @elements.reject! { |elem| e.elements.include?(elem)}
      self
    else
      if @elements.include?(e)
        @elements.delete(e)
        self
      else
        raise 'Element does not exist in this set!'
      end
    end
  end

  def *(set)
    if set.is_a? MathSet
      @elements.select!{ |elem| set.elements.include?(elem)}
      self
    else
      raise ArgumentError ,'Argument is not a set!'    
    end
  end

end
