require 'numby'

describe Array do
  describe '#sum' do
    it 'should return 0 for empty array' do
      [].sum.should == 0
    end

    it 'should return 5 for [5]' do
      [5].sum.should == 5
    end

    it 'should return 10 for [1,4,7,-2]' do
      [1,4,7,-2].sum.should == 10
    end
  end

  describe '#mult' do
    it 'should return 1 for empty array' do
      [].mult.should == 1
    end

    it 'should return 5 for [5]' do
      [5].mult.should == 5
    end

    it 'should return -56 for [1,4,7,-2]' do
      [1,4,7,-2].mult.should == -56
    end
  end
end
    


