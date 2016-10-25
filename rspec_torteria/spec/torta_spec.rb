require 'torta'

describe Torta do

  let(:type)  { "milanesa" }
  let(:torta) { Torta.new(type) }

  subject { torta }
  it { is_expected.to respond_to(:type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Torta of the specified type" do
        expect(torta.type).to eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Torta.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do

    it "returns the type of the torta" do
      expect(torta.type).to eq("milanesa")
    end
  end

  describe "#bake!" do

    it "requires an integer time argument" do
      expect { torta.bake!('non-integer') }.to raise_error(TypeError)
    end

    it "returns the torta object" do
      expect(torta.bake!(5)).to eq(torta)
    end

    it "changes the status of the torta when given enough time" do
      expect { torta.bake!(5) }.to change(torta, :status)
      expect { torta.bake!(2) }.to change(torta, :status)
      expect { torta.bake!(4) }.to change(torta, :status)
    end
  end

  describe "#status" do
    it "returns the torta's current status" do
      expect(torta.status).to eq('crudo')
    end

    context "when unbaked" do
      it "is `crudo`" do
        torta.bake!(0)
        expect(torta.status).to eq('crudo')
      end
    end

    context "when baked for less than 5 minutes" do
      it "is `crudo`" do
        torta.bake!(4)
        expect(torta.status).to eq('crudo')
      end
    end

    context "when baked for at least 5 but less than 7 minutes" do
      it "is `casi listo`" do
        torta.bake!(5)
        expect(torta.status).to eq('casi listo')
        torta.bake!(1)
        expect(torta.status).to eq('casi listo')
      end
    end

    context "when baked for at least 7 but less or equal than 10 minutes" do
      it "is `listo`" do
        torta.bake!(7)
        expect(torta.status).to eq('listo')
        torta.bake!(3)
        expect(torta.status).to eq('listo')
      end
    end

    context "when baked for at least 11 minutes" do
      it "is `quemado`" do
        torta.bake!(11)
        expect(torta.status).to eq('quemado')
        torta.bake!(1)
        expect(torta.status).to eq('quemado')
      end
    end
  end

  describe "#bake_time" do

    let(:type2)  { "jamon" }
    let(:torta2) { Torta.new(type2) }
    let(:type3)  { "queso" }
    let(:torta3) { Torta.new(type3) }

    it "returns bake time of the specified type" do
      expect(torta.bake_time).to eq(10)
      expect(torta2.bake_time).to eq(3)
      expect(torta3.bake_time).to eq(8)
    end
  end
end
