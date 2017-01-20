require_relative '../math_set'

describe MathSet do
  
  describe '#+' do
    
    before(:each) do
      @num = 5
      @num1 = 3
      @num2 = 4
      @set1 = MathSet.new
      @set2 = MathSet.new(@num1,@num2)
    end

    it 'adds element to set' do
      @set1 + @num
      expect(@set1.elements).to include(@num) 
    end

    it 'unites two sets' do
      set3 = @set1 + @set2
      expect(set3.elements).to include(@num1)
      expect(set3.elements).to include(@num2)
    end

  end

  describe '#-' do
    before(:each) do
      @set1 = MathSet.new(2,3)
      @num1 = 3
    end

    it 'removes element from set' do
    end
  end
end