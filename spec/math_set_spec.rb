require_relative '../math_set'

describe MathSet do
  
  describe '#count' do
    before(:all) do
      @set1 = MathSet.new
      @set2 = MathSet.new(1,2,3,3)
    end

    it 'returns 0 when empty set' do
      expect(@set1.count).to eq 0
    end

    it 'returns set size' do
      expect(@set2.count).to eq 3
    end
  end

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

    it 'does not repeat same elements' do
      num1 = 3
      num2 = 5
      set = MathSet.new(num1,num2)
      set = set + @set2
      expect(set.elements).to include(num2)
      expect(set.count).to eq 3
    end

  end

  describe '#-' do
    before(:each) do
      @set1 = MathSet.new(2,3)
      @num1 = 3
      @not_existing_num = 7
    end

    describe 'element' do
      
      describe 'if element exists in set' do
        
        it 'removes it' do
          @set1 - @num1
          expect(@set1.elements).to_not include(@num1)
        end

      end

      describe 'if element does not exits in set' do
        it 'raises an exception' do
          expect{@set1 - @not_existing_num}.to raise_error('Element does not exist in this set!')
        end
      end
    
    end

    describe 'sets' do
      before(:each) do
        @num = [1,2,3,4]
        @set1 = MathSet.new(@num[1],@num[3],@num[2])
        @set2 = MathSet.new(@num[1],@num[0])
      end

      it 'substracts two sets' do
        set3 = @set1 - @set2
        expect(set3.elements).to include(@num[3])
        expect(set3.elements).to include(@num[2])
        expect(set3.elements).to_not include(@num[1])
      end

    end
  end

  describe '#*' do
    before(:each) do
      @num = [1,2,3,4,5,6]
      @set1 = MathSet.new(@num[1],@num[3],@num[2],@num[5])
      @set2 = MathSet.new(@num[1],@num[0],@num[5],@num[2],@num[4])
    end

    describe 'sets' do
      it 'returns intersection of two sets' do
        set = @set1 * @set2
        expect(set.elements).to include(@num[1])
        expect(set.elements).to include(@num[5])
        expect(set.elements).to include(@num[2])
        expect(set.count).to eq 3
      end
    end

    describe 'sth different' do
      it 'raises ArgumentError' do
         expect{ @set1 * ""}.to raise_error('Argument is not a set!')
      end
    end
  end

end