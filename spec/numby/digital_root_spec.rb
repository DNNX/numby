require 'spec_helper'

describe Integer, '#digital_root' do

  context 'default base' do
    it 'should find digital root for regular number' do
      124.digital_root.should == 7
    end

    it 'should sum up digits recursively until single-digit number left' do
      # 789 => 7+8+9 = 24 => 2+4 => 6
      789.digital_root.should == 6
    end

    it 'should return self if it is single-digit number' do
      3.digital_root.should == 3
    end

    it 'should ignore sign' do
      -88.digital_root.should == 7
    end

    it 'should return 0 for zero' do
      0.digital_root.should == 0
    end

    it 'should work for really big numbers' do
      999_999_999_999_999.digital_root.should == 9
    end
  end

  context 'base is given' do
    it 'should work correctly with different bases' do
      # 0xAA => 0xA + 0xA = 0x14 => 0x1 + 0x4 = 0x5 = 5
      0xAA.digital_root(16).should == 5
    end

    it 'should fail in case of base == 1' do
      expect { 10.digital_root(1) }.to raise_error(ArgumentError)
    end

    it 'should fail in case of base == 0' do
      expect { 10.digital_root(0) }.to raise_error(ArgumentError)
    end

    it 'should fail in case of base < 0' do
      expect { 10.digital_root(-12) }.to raise_error(ArgumentError)
    end
  end

end
