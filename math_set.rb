class MathSet
  attr_reader :elements

  def initialize(*e)
    @elements = e.uniq
  end

  def count
    @elements.length
  end

  def +(e)
    if e.is_a? MathSet
      @elements += e.elements
      @elements.uniq!
      self
    else
      @elements << e unless @elements.include?(e)
      self
    end
  end

  def -(e)
    if e.is_a? MathSet
      new_set = MathSet.new
      new_set.elements = @elements - e.elements
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
      new_set.elements = @elements & set.elements
      new_set
    else
      raise ArgumentError ,'Argument is not a set!'
    end
  end

  def is_subset?(set)
    if set.is_a? MathSet
      return false if count > set.count

      elements.all?{|elem| set.elements.include?(elem) }
    else
      raise ArgumentError ,'Argument is not a set!'
    end
  end

  protected
    attr_writer :elements

end
