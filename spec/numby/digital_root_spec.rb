require 'spec_helper'

describe Integer, '#digital_root' do

  context 'default base' do
    {   124 => 7, # 1+2+4 = 7
        789 => 6, # 789 => 7+8+9=24 => 2+4=6
        3   => 3, # single digit number
        0   => 0, # special case
        -88 => 7, # ignore minus sign
        999_999_999_999_999 => 9 # big number
    }.each do |number, root|
      it "#{number}.digital_root should be equal to #{root}" do
        number.digital_root.should == root
      end
    end
  end

  context 'base is given' do
    it 'should work correctly with different bases' do
      # 0xAA => 0xA + 0xA = 0x14 => 0x1 + 0x4 = 0x5 = 5
      0xAA.digital_root(16).should == 5
    end

    for base in [1, 0, -10]
      it "should raise error in case of base == #{base}" do
        expect { 10.digital_root(base) }.to raise_error(ArgumentError)
      end
    end
  end

end
