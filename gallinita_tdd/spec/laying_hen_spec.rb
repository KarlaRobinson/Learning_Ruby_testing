require 'laying_hen'

describe LayingHen do
  # LayingHen tests here
  let(:hen) { LayingHen.new() }

  context "#age" do
    it "returns the hen's age" do
      expect(hen.age).to eq(0)
    end
  end

  context "#any_eggs?" do
    it "returns false if a hen has no eggs" do
      expect(hen.any_eggs?).to eq(false)
    end
  end

  context "#age!" do
    it "ages the hen 1 month" do
      hen.age!
      expect(hen.age).to eq(1)
      3.times{hen.age!}
      expect(hen.age).to eq(4)
    end

    it "has hen lay 4 eggs if older than 3 months" do
      4.times{hen.age!}
      expect(hen.any_eggs?).to eq(true)
    end
  end

  context "#collect" do
    it "removes one egg from hen" do
      4.times{hen.age!}
      expect(hen.any_eggs?).to eq(true)
      4.times{hen.collect}
      expect(hen.any_eggs?).to eq(false)
    end

    it "creates an egg object" do
      expect(hen.collect).to be_an_instance_of Egg
    end

    # it "adds eggs to basket" do
    # end
  end

  context "#increase_hatched_hour" do
    it "increases by x number of hours" do
      expect(hen.increase_hatched_hour(5)).to eq(5)
    end
  end

  context "#old?" do
    it "returns true if hen age is older than 10" do
      expect(hen.old?).to eq(false)
      11.times{hen.age!}
      expect(hen.old?).to eq(true)
    end
  end
end

describe Egg do
  # Egg tests here
  let(:egg) { Egg.new(0) }
  let(:egg2) { Egg.new(4) }

  context "#rotten?" do
    it "returns true if egg hatched hours is greater than 3" do
      expect(egg.rotten?).to eq(false)
      expect(egg2.rotten?).to eq(true)
    end
  end
end










