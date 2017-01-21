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
      new_set = MathSet.new
      new_set.elements = @elements.reject { |elem| e.elements.include?(elem)}
      new_set
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
      new_set = MathSet.new
      new_set.elements = @elements.select{ |elem| set.elements.include?(elem)}
      new_set
    else
      raise ArgumentError ,'Argument is not a set!'    
    end
  end

  def is_subset?(set)
    if set.is_a? MathSet

      if count > set.count
        return false
      end

      i = 0
      elements.length.times do
        return false unless set.elements.include?(elements[i])
        i = i + 1
      end

      return true
    else
      raise ArgumentError ,'Argument is not a set!' 
    end
  end

  protected
    attr_writer :elements

end
